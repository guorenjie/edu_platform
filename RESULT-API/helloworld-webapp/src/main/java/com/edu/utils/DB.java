package com.edu.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
 
/**
 * 连接数据库工具类
* @author   
* @date 2019年4月27日
 */
public class DB {
	private static DB dbUtil;					// 创建自身类的对象
	private static String driver = ""; 			// 驱动
	private static String url = ""; 			// url
	private static String username = ""; // 用户名
	private static String password = "";     // 密码
	private static Connection c = null; 				// 连接对象
	private DB() {
		//构造方法私有化，保证外部调用者无法直接创建该类对象
	}
	//单例模式：该类生成的对象只有一个
	//懒汉式，饿汉式
	public static DB getInstance() {
		if(dbUtil==null) {
			dbUtil = new DB();
		}
		return dbUtil;
	}
	static {
		try {
			String baseurl = DB.class.getResource("/").getPath()+"db.properties";		
			// 获取配置文件中的输入流
			InputStream is = new FileInputStream(baseurl);
			// 根据键值对，解析文件中的字段
			// 加载输入流
			Properties properties = new Properties();
			properties.load(is);
			driver = properties.getProperty("driver");// 获取驱动地址
			url = properties.getProperty("url");
			username = properties.getProperty("name");
			password = properties.getProperty("password");
			Class.forName(driver);
 
		} catch (IOException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取连接
	 * @return
	 */
	public static Connection getConnection() {
		try {
			c = DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;

	}
	
	/**
	 * 定义一个静态方法,用于释放资源
	 */
	public static void close(ResultSet rs, Statement stat, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stat != null) {
			try {
				stat.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
