<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.bdi.erp.common.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp" %>
<%
String uiName = request.getParameter("uiName");
String uiId = request.getParameter("uiId");
String uiPwd = request.getParameter("uiPwd");
String uiDesc = request.getParameter("uiDesc");
String uiAge = request.getParameter("uiAge");
String diNo = request.getParameter("diNo");
String uiNo = request.getParameter("uiNo");

Connection con = DBConnection.getCon();
String sql = "update user_info set uiName=?,";
sql += " uiId=?,";
sql += " uiPwd=?,";
sql += " uiDesc=?,";
sql += " uiAge=?,";
sql += " diNo=?";
sql += " where uiNo=?";

PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, uiName);
ps.setString(2, uiId);
ps.setString(3, uiPwd);
ps.setString(4, uiDesc);
ps.setString(5, uiAge);
ps.setString(6, diNo);
ps.setString(7, uiNo);

int cnt = ps.executeUpdate();
DBConnection.close();

if(cnt==1){
%>
<script>
	alert("수정되었습니다.")
	location.href="<%=rPath%>/views/userinfo/userList.jsp";
</script>
<%
}
%>