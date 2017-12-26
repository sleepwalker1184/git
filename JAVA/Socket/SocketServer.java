package demo2;

import java.awt.*;
import java.awt.event.*;
import java.util.*;
import java.io.*;
import java.math.RoundingMode;
import java.net.*;
import java.text.DecimalFormat;

import javax.swing.*;

import demo2.CFrame.fClient;



class SFrame extends Frame 
{
	ServerSocket server = null;
	Socket client = null;
	TextField port = new TextField("4300");
	Button start = new Button("Start");
	TextArea sfTA = new TextArea(25, 60);
	TextField sfTF = new TextField(40);
	Button say = new Button("say");
	SFListener sfListener = new SFListener();
	SFrame sframe;
	String Filename = null;
	Button file;

	//define frame
	SFrame(String title) 
	{
		super(title);
		sframe = this;
		file = new Button("OpenFile");
		file.addActionListener(sfListener);
		init();

		start.addActionListener(sfListener);
		say.addActionListener(sfListener);
		
		
		addWindowListener( 
				new WindowAdapter() 
				{
					public void windowClosing(WindowEvent e) 
					{ 
						try 
						{							
							server.close();
						}
						catch (Exception ee) 
						{
							ee.printStackTrace();
						}
						System.exit(0);
					}
				});
		this.setVisible(true);
		try {
			fServer Fserver = new fServer();
			Fserver.load();
			Fserver.close();
		} catch (Exception e) {					
			e.printStackTrace();
		}
	}

	//init frame
	void init() 
	{
		
		setLocation(10, 10); 
		setSize(400, 400); 
		setResizable(false); 
		setBackground(Color.DARK_GRAY); 
		sfTA.setBackground(Color.WHITE);

		Panel North = new Panel();
		North.add(new Label("port"));
		North.add(this.port);
		North.add(this.start);
		this.add(North, BorderLayout.NORTH);
		Panel Center = new Panel();
		Center.add(this.sfTA);
		this.add(Center, BorderLayout.CENTER);
		Panel South = new Panel();
		South.add(new Label("say"));
		South.add(this.sfTF);
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

					sfTA.append("========start transfering file ======== \n");
					byte[] bytes = new byte[1024];
					int length = 0;
					long progress = 0;
					while ((length = fis.read(bytes, 0, bytes.length)) != -1) {
						dos.write(bytes, 0, length);
						dos.flush();
						progress += length;
						sfTA.append("| " + (100 * progress / file.length()) + "% | \n");
					}
					System.out.println();
					sfTA.append("=======Transfering file succeeded!======== \n");
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
	class SFListener implements ActionListener 
	{
		public void Open() 
		{
			FileDialog fd = new FileDialog(sframe, "FileDialog", FileDialog.LOAD);
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
			if ("Start" == s) 
			{
				try 
				{
					start.setEnabled(false);
					int i = Integer.parseInt(port.getText());
					sfTA.append("Server Port :" + port.getText() + "\n");
					server = new ServerSocket(i);
					client = server.accept();
					sfTA.append("a client connect ...\n");

					ServerThread sfST = new ServerThread(); //
					sfST.start();
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
					PrintWriter ss = new PrintWriter(client.getOutputStream());
					String str = sfTF.getText();
					if (str != "") 
					{
						sfTA.append("Server say:" + str + "\n");
						ss.write("Server say:" + str + "\n");
						ss.flush();
					}
					sfTF.setText("");
				} 
				catch (Exception se) 
				{
					se.printStackTrace();
				}
			} 
			else if (s == "OpenFile") 
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
	class ServerThread extends Thread 
	{
		public void run() 
		{
			try 
			{
				
				BufferedReader br = new BufferedReader(new InputStreamReader(client.getInputStream()));
				String s = br.readLine();

				while (!"client say:bye".equals(s) && s != null) 
				{
					sfTA.append(s + "\n");
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


//main
public class SocketServer 
{
	public static void main(String[] args) 
	{
		SFrame sf = new SFrame("sever");		     
	}
}
