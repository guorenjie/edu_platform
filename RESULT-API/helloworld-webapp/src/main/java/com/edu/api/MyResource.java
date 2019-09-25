/*
 * Copyright (c) 2010, 2018 Oracle and/or its affiliates. All rights reserved.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse Distribution License v. 1.0, which is available at
 * http://www.eclipse.org/org/documents/edl-v10.php.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

package com.edu.api;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.apache.commons.io.FileUtils;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.edu.utils.Checker;
import com.edu.utils.DBUtil;

/**
 * 资源文件
* @author  
* @date 2019年4月26日
 */
@Path("edu")
@Consumes("application/x-www-form-urlencoded") //接收数据类型
@Produces("text/plain;charset=utf-8") //返回数据类型

public class MyResource {
	
    @POST
    @Path("postTest")
    public String postTest(@FormParam("uid")String uid) {
    	String sql = "select * from userinfo where user_id='"+uid+"'";
    	List userlList = DBUtil.query(sql);
    	Map user = (Map) userlList.get(0);
        return "通过post请求的参数："+user.get("username");
    }
    
    @GET
    @Path("getTest")
    public String getTest(@QueryParam("uid") String uid) {
        return "通过get请求的参数："+uid;
    }
    
    /**
     * 用户注册
    * @param username
    * @param user_id
    * @param password
    * @return    参数  
    * String    返回类型   json字符串{code：‘’，msg：‘’}
    * @throws
     */
    @POST
    @Path("register")
    public String register(@FormParam("username")String username,@FormParam("user_id")String user_id,@FormParam("password")String password) {
    	JSONObject rValue = new JSONObject();
    	String sql = "INSERT INTO userinfo(user_id, username, password, type, userimg) VALUES ('"+user_id+"', '"+username+"', '"+password+"', '2', 'resources/headimg.png');";
    	boolean flag = DBUtil.save(sql);
    	if(flag){
    		rValue.put("code", "0");
        	rValue.put("msg", "注册成功");
    	}else {
    		rValue.put("code", "1");
        	rValue.put("msg", "注册失败，用户已存在");
		}
        return rValue.toString();
    }
    
    /**
     * 用户登陆
    * @param user_id
    * @param password
    * @return    参数  
    * String    返回类型   json字符串{code：‘’，msg：‘’}
    * @throws
     */
    @POST
    @Path("login")
    public String login(@FormParam("user_id")String user_id,@FormParam("password")String password) {
    	JSONObject rValue = new JSONObject();
    	String sql = "select * from userinfo where user_id='"+user_id+"'";
    	List userList = DBUtil.query(sql);
    	if(!Checker.isEmpty(userList)){
    		String users = new JSONArray(userList).toString();
    		if(!users.equals("[null]")){
    			Map user = (Map) userList.get(0);
            	if(password.equals(user.get("password"))){
            		rValue.put("code", "0");
                	rValue.put("msg", "登陆成功");
                	
                	rValue.put("user", users);
            	}else {
            		rValue.put("code", "1");
                	rValue.put("msg", "登陆失败，密码错误");
        		}
    		}else{
    			rValue.put("code", "2");
            	rValue.put("msg", "登陆失败，用户不存在");
    		}
    		
    	}else{
    		rValue.put("code", "2");
        	rValue.put("msg", "登陆失败，用户不存在");
    	}
    	
        return rValue.toString();
    }
    
    /**
     * 首页轮播图
    * @return    参数  
    * String    返回类型   json字符串{code：‘’，msg：‘’}
    * @throws
     */
    @POST
    @Path("getAd")
    public String getAd() {
    	JSONObject rValue = new JSONObject();
    	String sql = "select * from var where vid like 'ad%'";
    	List adList = DBUtil.query(sql);
    	if(!Checker.isEmpty(adList)){
    		String ads = new JSONArray(adList).toString();
    		if(!ads.equals("[null]")){
    			rValue.put("code", "0");
            	rValue.put("msg", "查询成功");
            	rValue.put("ad", ads);
            	
    		}else{
    			rValue.put("code", "1");
            	rValue.put("msg", "资源不存在");
    		}
    		
    	}else{
    		rValue.put("code", "1");
        	rValue.put("msg", "资源不存在");
    	}
    	
        return rValue.toString();
    }
    
    /**
     * 首页显示科目（精选课程）
    * @param ishomeshow
    * @return    参数  
    * String    返回类型   json字符串{code：‘’，msg：‘’}
    * @throws
     */
    @POST
    @Path("getSubject")
    public String getSubject(@FormParam("ishomeshow")String ishomeshow) {
    	JSONObject rValue = new JSONObject();
    	String sql = "select * from subject order by ishomeshow desc,kmid limit 6  offset 0";
    	List subjectList = DBUtil.query(sql);
    	if(!Checker.isEmpty(subjectList)){
    		String subjects = new JSONArray(subjectList).toString();
    		if(!subjects.equals("[null]")){
    			rValue.put("code", "0");
            	rValue.put("msg", "查询成功");
            	rValue.put("subject", subjects);
            	
    		}else{
    			rValue.put("code", "1");
            	rValue.put("msg", "科目不存在");
    		}
    		
    	}else{
    		rValue.put("code", "1");
        	rValue.put("msg", "科目不存在");
    	}
    	
        return rValue.toString();
    }
    
    /**
     * 获取课程
    * @param kmxx 小学/初中/高中=1/2/3
    * @param kmlx 语文/数学/英语/物理=1/2/3/4
    * @param type 0=所有 1=我的课程
    * @return    参数  
    * String    返回类型   json字符串{code：‘’，msg：‘’}
    * @throws
     */
    @POST
    @Path("getCourses")
    public String getCourses(@FormParam("kmxx")String kmxx,@FormParam("kmlx")String kmlx,@FormParam("type")String type) {
    	JSONObject rValue = new JSONObject();
    	String sql = "select * from course where kmid in (select kmid from subject where kmxx='"+kmxx+"' and kmlx='"+kmlx+"')";
    	List courseList = DBUtil.query(sql);
    	if(!Checker.isEmpty(courseList)){
    		String courses = new JSONArray(courseList).toString();
    		if(!courses.equals("[null]")){
    			rValue.put("code", "0");
            	rValue.put("msg", "查询成功");
            	rValue.put("course", courses);
            	
    		}else{
    			rValue.put("code", "1");
            	rValue.put("msg", "课程不存在");
    		}
    		
    	}else{
    		rValue.put("code", "1");
        	rValue.put("msg", "课程不存在");
    	}
    	
        return rValue.toString();
    }
    
    /**
     * 获取课程信息
    * @param kcid 课程id
    * @return    参数  
    * String    返回类型   json字符串{code：‘’，msg：‘’}
    * @throws
     */
    @POST
    @Path("getCourseInfo")
    public String getCourseInfo(@FormParam("kcid")String kcid) {
    	JSONObject rValue = new JSONObject();
    	String sql = "select * from course where kcid ='"+kcid+"'";
    	List courseList = DBUtil.query(sql);
    	if(!Checker.isEmpty(courseList)){
    		String courses = new JSONArray(courseList).toString();
    		if(!courses.equals("[null]")){
    			rValue.put("code", "0");
            	rValue.put("msg", "查询成功");
            	rValue.put("courseInfo", courses);
            	
    		}else{
    			rValue.put("code", "1");
            	rValue.put("msg", "课程不存在");
    		}
    		
    	}else{
    		rValue.put("code", "1");
        	rValue.put("msg", "课程不存在");
    	}
    	
        return rValue.toString();
    }
    
    /**
     * 获取问题列表
    * @param kcid 课程id
    * @param type  1=课程问题，0=入学问题
    * @param wtid  问题id
    * @return    参数  
    * String    返回类型   json字符串{code：‘’，msg：‘’}
    * @throws
     */
    @POST
    @Path("getQuestion")
    public String getQuestion(@FormParam("kcid")String kcid,@FormParam("type")String type,@FormParam("wtid")String wtid) {
    	JSONObject rValue = new JSONObject();
    	String sql = "select q.wtid,q.wtbt,q.twsj,q.wtnr,q.hfsj,q.hfnr,(select userimg from userinfo where user_id=q.twr) twimg,(select username from userinfo where user_id=q.twr) twname,(select userimg from userinfo where user_id=q.hfr) hfimg,(select username from userinfo where user_id=q.hfr) hfname from question q where 1=1 ";
    	if(!Checker.isEmpty(kcid)){
    		sql+= " and q.kcid='"+kcid+"'";
    	}
    	if(!Checker.isEmpty(type)){
    		sql+= " and q.wtlx ='"+type+"'";
    	}
    	if(!Checker.isEmpty(wtid)){
    		sql+= " and q.wtid ='"+wtid+"'";
    	}
    	sql+=" order by q.twsj desc";
    	List questionList = DBUtil.query(sql);
    	if(!Checker.isEmpty(questionList)){
    		String questions = JSON.toJSONStringWithDateFormat(new JSONArray(questionList),"yyyy-MM-dd HH:mm:ss");
    		if(!questions.equals("[null]")){
    			rValue.put("code", "0");
            	rValue.put("msg", "查询成功");
            	rValue.put("question", questions);
            	
    		}else{
    			rValue.put("code", "1");
            	rValue.put("msg", "问题不存在");
    		}
    		
    	}else{
    		rValue.put("code", "1");
        	rValue.put("msg", "问题不存在");
    	}
    	
        return rValue.toString();
    }
    
    /**
     * 发起提问
    * @param kcid 问题id
    * @param type 问题类型 1=课程问题，0=入学问题
    * @param title 问题标题
    * @param msg 问题内容
    * @param twr 提问人id
    * @return    参数  
    * String    返回类型  
    * @throws
     */
    @POST
    @Path("addQuestion")
    public String addQuestion(@FormParam("kcid")String kcid,@FormParam("type")String type,@FormParam("title")String title,@FormParam("msg")String msg,@FormParam("twr")String twr) {
    	JSONObject rValue = new JSONObject();
    	String sql = "INSERT INTO question(wtbt,wtnr,twsj,wtlx,kcid,twr) VALUES  ('"+title+"', '"+msg+"', now(), '"+type+"', '"+kcid+"', '"+twr+"');";
    	boolean flag = DBUtil.save(sql);
    	if(flag){
    		rValue.put("code", "0");
        	rValue.put("msg", "提交成功");
    	}else {
    		rValue.put("code", "1");
        	rValue.put("msg", "提交失败");
		}
        return rValue.toString();
    }
    
    /**
     * 回复问题
    * @param wtid
    * @param hfr
    * @param hfnr
    * @return    参数  
    * String    返回类型  
    * @throws
     */
    @POST
    @Path("updateQuestion")
    public String updateQuestion(@FormParam("wtid")String wtid,@FormParam("hfr")String hfr,@FormParam("hfnr")String hfnr) {
    	JSONObject rValue = new JSONObject();
    	String sql = "update question set hfr='"+hfr+"',hfsj=now(),hfnr='"+hfnr+"' where wtid='"+wtid+"'";
    	boolean flag = DBUtil.update(sql);
    	if(flag){
    		rValue.put("code", "0");
        	rValue.put("msg", "回复成功");
    	}else {
    		rValue.put("code", "1");
        	rValue.put("msg", "回复失败");
		}
        return rValue.toString();
    }
    
    /**
     * 获取试卷标题
    * @param sjid
    * @return    参数  
    * String    返回类型   json字符串{code：‘’，msg：‘’}
    * @throws
     */
    @POST
    @Path("getPaper")
    public String getPaper(@FormParam("sjid")String sjid) {
    	JSONObject rValue = new JSONObject();
    	String sql = "select * from testpaper where 1=1 ";
    	if(!Checker.isEmpty(sjid)){
    		sql+=" and sjid='"+sjid+"'";
    	}
    	sql+= "order by sjdj,sjid";
    	List paperList = DBUtil.query(sql);
    	if(!Checker.isEmpty(paperList)){
    		String papers = new JSONArray(paperList).toString();
    		if(!papers.equals("[null]")){
    			rValue.put("code", "0");
            	rValue.put("msg", "查询成功");
            	rValue.put("paper", papers);
    		}else{
    			rValue.put("code", "1");
            	rValue.put("msg", "试卷不存在");
    		}
    		
    	}else{
    		rValue.put("code", "1");
        	rValue.put("msg", "试卷不存在");
    	}
    	
        return rValue.toString();
    }
    
    /**
     * 随机获取5道试卷题目
    * @param sjid
    * @return    参数  
    * String    返回类型   json字符串{code：‘’，msg：‘’}
    * @throws
     */
    @POST
    @Path("getTopic")
    public String getTopic(@FormParam("sjid")String sjid) {
    	JSONObject rValue = new JSONObject();
    	String sql = "select * from topic where sjid='"+sjid+"' ORDER BY RANDOM() LIMIT 5";
    	List topicList = DBUtil.query(sql);
    	if(!Checker.isEmpty(topicList)){
    		String topics = new JSONArray(topicList).toString();
    		if(!topics.equals("[null]")){
    			rValue.put("code", "0");
            	rValue.put("msg", "查询成功");
            	rValue.put("tm", topics);
    		}else{
    			rValue.put("code", "1");
            	rValue.put("msg", "试卷题目不存在，请重新选择试卷");
    		}
    		
    	}else{
    		rValue.put("code", "1");
        	rValue.put("msg", "试卷题目不存在，请重新选择试卷");
    	}
    	
        return rValue.toString();
    }
    
    /**
     * 获取用户信息
    * @param userid
    * @return    参数  
    * String    返回类型   json字符串{code：‘’，msg：‘’}
    * @throws
     */
    @POST
    @Path("getUserInfo")
    public String getUserInfo(@FormParam("userid")String userid) {
    	JSONObject rValue = new JSONObject();
    	String sql = "select * from userinfo where user_id='"+userid+"'";
    	List userList = DBUtil.query(sql);
    	if(!Checker.isEmpty(userList)){
    		String users = JSON.toJSONStringWithDateFormat(new JSONArray(userList),"yyyy-MM-dd");
    		if(!users.equals("[null]")){
    			rValue.put("code", "0");
            	rValue.put("msg", "查询成功");
            	rValue.put("user", users);
    		}else{
    			rValue.put("code", "1");
            	rValue.put("msg", "用户信息不存在");
    		}
    		
    	}else{
    		rValue.put("code", "1");
        	rValue.put("msg", "用户信息不存在");
    	}
    	
        return rValue.toString();
    }
    
    /**
     * 编辑用户信息
    * @return    参数  
    * String    返回类型  
    * @throws
     */
    @POST
    @Path("setUserInfo")
    public String setUserInfo(@FormParam("userid")String userid,@FormParam("userimg")String userimg,@FormParam("username")String username,@FormParam("sex")int sex,@FormParam("birth")String birth) {
    	JSONObject rValue = new JSONObject();
    	String sql = "update userinfo set ";
    	if(!Checker.isEmpty(userimg)){
    		sql+="userimg='"+userimg+"'";
    	}else{
        		sql+="username='"+username+"'"+",sex="+sex+",birth='"+birth+"' ";    	
    	}
    	sql+=" where user_id='"+userid+"'";
    	boolean flag = DBUtil.update(sql);
    	if(flag){
    		rValue.put("code", "0");
        	rValue.put("msg", "修改成功");
    	}else {
    		rValue.put("code", "1");
        	rValue.put("msg", "修改失败");
		}
        return rValue.toString();
    }
    
    @POST
    @Path("uploadImg")
    @Produces(MediaType.APPLICATION_JSON+ ";charset=UTF-8")
    @Consumes(MediaType.MULTIPART_FORM_DATA)
    public String uploadImg(@FormDataParam("userid")String userid,@FormDataParam("file") InputStream fileInputStream,
            @FormDataParam("file") FormDataContentDisposition disposition, @Context ServletContext stc) {
    	System.err.println(stc.getRealPath("/../ROOT")+"/static/img/personinfo/"+userid);
        try {
        	File file = new File(stc.getRealPath("/../ROOT")+"/static/img/personinfo/"+userid, disposition.getFileName());
            FileUtils.copyInputStreamToFile(fileInputStream, file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String url = "/personinfo/"+userid+"/"+disposition.getFileName();
        return url;
    }
    
    /**
     * 获取我的课程
    * @param userid 用户id
    * @param type 0=所有 1=前2个
    * @return    参数  
    * String    返回类型   json字符串{code：‘’，msg：‘’}
    * @throws
     */
    @POST
    @Path("getMyCourses")
    public String getMyCourses(@FormParam("userid")String userid,@FormParam("type")String type) {
    	JSONObject rValue = new JSONObject();
    	String sqlCase = "";
    	if(type.equals("1")){
    		sqlCase = " limit 2";
    	}
    	String sql = "select c.* from course c,usercourse u where c.kcid= u.kcid and u.userid='"+userid+"' order by createtime desc "+sqlCase+"";
    	List courseList = DBUtil.query(sql);
    	if(!Checker.isEmpty(courseList)){
    		String courses = new JSONArray(courseList).toString();
    		if(!courses.equals("[null]")){
    			rValue.put("code", "0");
            	rValue.put("msg", "查询成功");
            	rValue.put("course", courses);
            	
    		}else{
    			rValue.put("code", "1");
            	rValue.put("msg", "课程不存在");
    		}
    		
    	}else{
    		rValue.put("code", "1");
        	rValue.put("msg", "课程不存在");
    	}
    	
        return rValue.toString();
    }
    
    /**
     * 播放课程时将课程添加到我的课程（如果此人已经有这个课程就不重复添加了）
    * @param kcid
    * @param userid
    * @return    参数  
    * String    返回类型   json字符串{code：‘’，msg：‘’}
    * @throws
     */
    @POST
    @Path("addMyCourse")
    public String addMyCourse(@FormParam("kcid")String kcid,@FormParam("userid")String userid) {
    	JSONObject rValue = new JSONObject();
    	String sql = "select count(*) as num from usercourse where userid='"+userid+"' and kcid='"+kcid+"' ";
    	List courseList = DBUtil.query(sql);
    	Map map = (Map) courseList.get(0);
    	long num =  (long) map.get("num");
		if(num==0){
			String addsql = "INSERT INTO usercourse(id, kcid, userid,createtime) VALUES ('"+UUID.randomUUID().toString()+"', '"+kcid+"', '"+userid+"', now());";
			boolean flag = DBUtil.save(addsql);
	    	if(flag){
	    		rValue.put("code", "0");
	        	rValue.put("msg", "课程添加成功");
	    	}else {
	    		rValue.put("code", "1");
	        	rValue.put("msg", "课程添加失败");
			}
		}
    	
        return rValue.toString();
    }
}
