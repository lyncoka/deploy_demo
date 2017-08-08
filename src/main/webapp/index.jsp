<%@page import="com.wizard.demo.CongfigResource"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN" >
<body>
<h2>Hello World!</h2>
<%
 InputStream is = CongfigResource.loadConfigFile("/_env.properties");
 String env = "none";
 if(is != null){
	 Properties p = new Properties();
	 p.load(is);
	 is.close();
	 
	 env = p.getProperty("env","null");
 }
%>
<br />
当前配置env=<%=env %>
</body>
</html>
