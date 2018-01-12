package ck;

import java.sql.*;

public class ck 
{
	static final String strDBDriver = "com.mysql.jdbc.Driver";
	static final String strDBUrl = "jdbc:mysql://localhost/enterprise?useUnicode=true&characterEncoding=UTF-8";
	static final String USER = "root";
	static final String PASS = "123";

	private Connection conn = null;
	private Statement stmt = null;
	ResultSet rs = null;

	public ck() 
	{
		try 
		{
			Class.forName(strDBDriver);
		} 
		catch (java.lang.ClassNotFoundException e) 
		{
			System.err.println("ck():" + e.getMessage());
		}
	}

	
	public ResultSet executeQuery(String sql) 
	{
		rs = null;
		try 
		{
			conn = DriverManager.getConnection(strDBUrl, USER, PASS);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException ex) {
			System.err.println("aq.executeQuery:" + ex.getMessage());
		}
		return rs;
	}

	public void executeUpdate(String sql) 
	{
		stmt = null;
		rs = null;
		try 
		{
			conn = DriverManager.getConnection(strDBUrl, USER, PASS);
			stmt = conn.createStatement();
			stmt.execute(sql);
			stmt.close();
			conn.close();
		} catch (SQLException ex) {
			System.err.println("aq.executeQuery:" + ex.getMessage());
		}
	}

	public void closeStmt() 
	{
		try 
		{
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void closeConn() 
	{
		try 
		{
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
}