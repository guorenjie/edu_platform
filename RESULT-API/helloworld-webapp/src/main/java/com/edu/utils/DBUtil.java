package com.edu.utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 连接数据库工具类
 * 
 * @author
 * @date 2019年4月27日
 */
public class DBUtil {

	/**
	 * 创建表
	 * 
	 * @param sql
	 *            传入创建表的sql语句
	 * @return
	 */
	public static boolean createTable(String sql) {
		System.out.println(sql);
		boolean flag = false;
		Connection c = null;
		Statement stmt = null;
		try {
			c = DB.getConnection();
			stmt = c.createStatement();
			stmt.executeUpdate(sql);
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
			flag = false;
		}
		DB.close(null, stmt, c);
		return flag;

	}

	/**
	 * 查询数据
	 * 
	 * @param sql
	 * @return 参数 List<Object> 返回类型
	 * @throws
	 */
	public static List query(String sql) {
		System.out.println(sql);
		List list = new ArrayList();
		Map map = null;
		Connection c = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			c = DB.getConnection();
			stmt = c.createStatement();
			rs = stmt.executeQuery(sql);
			ResultSetMetaData md = rs.getMetaData();// 获取键名
			int columnCount = md.getColumnCount();// 获取列数
			while (rs.next()) {
				map = new HashMap();
				for (int i = 1; i <= columnCount; i++) {
					map.put(md.getColumnName(i), rs.getObject(i));// 获取键名及值
				}
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		DB.close(rs, stmt, c);
		return list;
	}

	/**
	 * 分页查询
	 * 
	 * @param sql
	 * @param rowNum
	 *            每页显示的行数
	 * @param pageNum
	 *            第几页
	 * @return 参数 List<Object> 返回类型
	 * @throws
	 */
	public static List query(String sql, int rowNum, int pageNum) {
		List list = new ArrayList();
		sql = sql + " limit " + rowNum + " offset " + (pageNum - 1) * rowNum;
		// limit 查询多少行数据 offset 从那行开始查
		// 总页数＝（数据总条数/每页显示的数量）//有余进一
		list = query(sql);
		return list;
	}

	/**
	 * 保存数据
	 * 
	 * @param sql
	 * @return
	 */
	public static boolean save(String sql) {
		System.out.println(sql);
		Connection c = null;
		Statement stmt = null;
		boolean flag = false;
		try {
			c = DB.getConnection();
			stmt = c.createStatement();
			stmt.executeUpdate(sql);
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
			flag = false;
		}
		DB.close(null, stmt, c);
		return flag;
	}

	/**
	 * 删除数据
	 * 
	 * @param sql
	 * @return
	 */
	public static boolean delete(String sql) {
		System.out.println(sql);
		Connection c = null;
		Statement stmt = null;
		boolean flag = false;
		try {
			c = DB.getConnection();
			stmt = c.createStatement();
			stmt.executeUpdate(sql);
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
			flag = false;
		}
		DB.close(null, stmt, c);
		return flag;
	}

	/**
	 * 更新数据
	 * 
	 * @param sql
	 * @return
	 */
	public static boolean update(String sql) {
		System.out.println(sql);
		Connection c = null;
		Statement stmt = null;
		boolean flag = false;
		try {
			c = DB.getConnection();
			stmt = c.createStatement();
			stmt.executeUpdate(sql);
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
			flag = false;
		}
		DB.close(null, stmt, c);
		return flag;
	}
}
