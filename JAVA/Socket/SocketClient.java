package demo2;

import java.awt.*;
import java.awt.event.*;
import java.util.*;
import java.io.*;
import java.math.RoundingMode;
import java.net.*;
import java.text.DecimalFormat;

import javax.swing.*;

import demo2.SFrame.fServer;
import demo2.SFrame.fServer.Task;


class CFrame extends Frame 
{
	Socket client = null;
	TextField port = new TextField("4300");
	TextField ip = new TextField("127.0.0.1");
	Button connect = new Button("connect");
	TextArea  cfTA = new TextArea(25, 60);
	TextField cfTF = new TextField(40);
	Button say = new Button("say");
	CFListener cfListener = new CFListener();
	CFrame cframe;
	String Filename = null;
	Button file;
	FileInputStream fis;
	DataOutputStream dos;

	//define frame
	CFrame(String title) 
	{
		super(title);
		cframe = this;
		file = new Button("OpenFile");
		file.addActionListener(cfListener);
		init();
		connect.addActionListener(cfListener);
		say.addActionListener(cfListener);

		addWindowListener( 
				new WindowAdapter() 
				{
					public void windowClosing(WindowEvent e) 
					{ 
						try 
						{
							client.close();
						} 
						catch (Exception ee) 
						{
							ee.printStackTrace();
						}
						System.exit(0);
					}
				});
		setVisible(true);
		try {
			fServer Fserver = new fServer();
			Fserver.load();
			Fserver.close();
		} catch (Exception e) {					
			e.printStackTrace();
		}
	}
	
	//init frame
	void init() {
		setLocation(500, 10); 
		setSize(400, 400); 
		setResizable(false); 
		setBackground(Color.DARK_GRAY); 
		cfTA.setBackground(Color.WHITE);

		Panel North = new Panel();
		North.add(new Label("IP"));
		North.add(this.ip);
		North.add(new Label("port"));
		North.add(this.port);
		North.add(this.connect);
		this.add(North, BorderLayout.NORTH);
		Panel Center = new Panel();
		Center.add(this.cfTA);
		this.add(Center, BorderLayout.CENTER);
		Panel South = new Panel();
		South.add(new Label("say"));
		South.add(this.cfTF);
		South.add(this.say);
		South.add(this.file);
		this.add(South, BorderLayout.SOUTH);		
		pack();
	}

	//receive file
	class fServer extends ServerSocket {

		private static final int SERVER_PORT = 8899;

		private DecimalFormat df = null;

		{

			df = new DecimalFormat("#0.0");
			df.setRoundingMode(RoundingMode.HALF_UP);
			df.setMinimumFractionDigits(1);
			df.setMaximumFractionDigits(1);
		}

		public fServer() throws Exception {
			super(SERVER_PORT);
		}

		public void load() throws Exception {
			while (true) {

				Socket socket = this.accept();
				new Thread(new Task(socket)).start();
			}
		}

		class Task implements Runnable {

			private Socket socket;

			private DataInputStream dis;
			private FileOutputStream fos;

			public Task(Socket socket) {
				this.socket = socket;
			}

			public void run() {
				try {
					dis = new DataInputStream(socket.getInputStream());

					String fileName = dis.readUTF();
					long fileLength = dis.readLong();
					File directory = new File("/Users/zhangalex/Desktop/file");				
					if (!directory.exists()) {
						directory.mkdir();
					}
					File file = new File(directory.getAbsolutePath() + File.separatorChar + fileName);
					fos = new FileOutputStream(file);

					byte[] bytes = new byte[1024];
					int length = 0;
					while ((length = dis.read(bytes, 0, bytes.length)) != -1) {
						fos.write(bytes, 0, length);
						fos.flush();
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if (fos != null)
							fos.close();
						if (dis != null)
							dis.close();
						socket.close();
					} catch (Exception e) {
					}
				}
			}
		}

		private String getFormatFileSize(long length) {
			double size = ((double) length) / (1 << 30);
			if (size >= 1) {
				return df.format(size) + "GB";
			}
			size = ((double) length) / (1 << 20);
			if (size >= 1) {
				return df.format(size) + "MB";
			}
			size = ((double) length) / (1 << 10);
			if (size >= 1) {
				return df.format(size) + "KB";
			}
			return length + "B";
		}

	}
	
	//send file
	class fClient extends Socket {

		private static final String SERVER_IP = "127.0.0.1";
		private static final int SERVER_PORT = 8899;

		private Socket client;

		private FileInputStream fis;

		private DataOutputStream dos;

		public fClient() throws Exception {
			super(SERVER_IP, SERVER_PORT);
			this.client = this;
			System.out.println("Cliect[port:" + client.getLocalPort() + "] Connect to the server successfully");
		}

		public void sendFile(String filename) throws Exception {
			try {
				File file = new File(filename);
				if (file.exists()) {
					fis = new FileInputStream(file);
					dos = new DataOutputStream(client.getOutputStream());				

					dos.writeUTF(file.getName());
					dos.flush();
					dos.writeLong(file.length());
					dos.flush();

					cfTA.append("========start transfering file ======== \n");
					byte[] bytes = new byte[1024];
					int length = 0;
					long progress = 0;
					while ((length = fis.read(bytes, 0, bytes.length)) != -1) {
						dos.write(bytes, 0, length);
						dos.flush();
						progress += length;
						cfTA.append("| " + (100 * progress / file.length()) + "% | \n");
					}
					System.out.println();
					cfTA.append("=======Transfering file succeeded!======== \n");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (fis != null)
					fis.close();
				if (dos != null)
					dos.close();
				client.close();
			}
		}


	}
	
	// listener
	class CFListener implements ActionListener 
	{
		public void Open() 
		{
			FileDialog fd = new FileDialog(cframe, "FileDialog", FileDialog.LOAD);
			fd.setVisible(true);
			if (fd != null) 
			{
				Filename = fd.getDirectory() + fd.getFile();
			}
		}
				
		//action
		public void actionPerformed(ActionEvent e) 
		{
			String s = e.getActionCommand();
			
			
			if ("connect" == s) 
			{
				try 
				{
					connect.setEnabled(false);
					int i = Integer.parseInt(port.getText());
					cfTA.append("Socket Connect IP :" + ip.getText() + "\nConnect Port :" + port.getText() + "\n");
					client = new Socket(ip.getText(), i);
					cfTA.append("connect ...\n");

					ClientThread cfCT = new ClientThread(); //
					cfCT.start();
				} 
				catch (Exception ce) 
				{
					ce.printStackTrace();
				}
			}
			
			
			else if ("say" == s) 
			{
				try 
				{
					String str = cfTF.getText();
					PrintWriter cc = new PrintWriter(client.getOutputStream());
					if (str != "") 
					{
						cc.write("client say:" + str + "\n");
						cc.flush();
						cfTA.append("client say:" + str + "\n");
					}
					cfTF.setText("");
				} 
				catch (Exception se) 
				{
					se.printStackTrace();
				}
			}
			
			
			else if ("OpenFile" == s) 
			{
				Open();
				try 
				{
					fClient Fclient = new fClient(); 
		            Fclient.sendFile(Filename); 
		            Fclient.close();
				} 
				catch (Exception e1) 
				{
					e1.printStackTrace();
				}
			}
		}
	}
		
	//new thread
	class ClientThread extends Thread 
	{
		public void run() 
		{
			try 
			{
				BufferedReader br = new BufferedReader(new InputStreamReader(client.getInputStream()));
				String s = br.readLine();
				while (!"Server say:bye".equals(s) && s != null) 
				{
					cfTA.append(s + "\n");
					s = br.readLine();
				}
			} 
			catch (Exception re) 
			{
				re.printStackTrace();
			}
		}
	}

}

// main
public class SocketClient 
{
	public static void main(String[] args) 
	{
		CFrame cf = new CFrame("client");
	}
}
