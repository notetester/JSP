<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="user" class="com.bean.User" scope="request" />
<jsp:setProperty name="user" property="*"/>    
<jsp:forward page="bean_tag_ex03.jsp"/> 