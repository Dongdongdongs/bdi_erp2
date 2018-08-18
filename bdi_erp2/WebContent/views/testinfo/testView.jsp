<%@page import="java.sql.ResultSet"%>
<%@page import="com.bdi.erp.common.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp" %>
<body>
<div class="container">
<%
String tId = "";
String tBirth = "";
String tContent	= "";
int tNo = Integer.parseInt(request.getParameter("tNo"));

Connection con = DBConnection.getCon();
String sql = "select tId, tBirth, tContent from test where tNo=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1,tNo);
ResultSet rs = ps.executeQuery();

if(rs.next()){
	tId = rs.getString("tId");
	tBirth = rs.getString("tBirth");
	tContent = rs.getString("tContent");
}
	StringBuffer sb = new StringBuffer(tBirth);
	sb.insert(4,"-");
	sb.insert(7,"-");
	
	
%>
<form action="<%=rPath %>/views/testinfo/userUpdateOK.jsp" onsubmit="return checkVal()">
	<fieldset>
		<legend>유저수정</legend>
		<table class="table table-bordered">
			<tr>
				<th>번호</th>
				<td><%=tNo %></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="tId" value="<%=tId	%>"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="tPwd"></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="date" name="tBirth" value="<%=sb%>"></td>
			</tr>
			<tr>
				<th>설명</th>
				<td><textarea name="tContent"><%=tContent %></textarea>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button>수정</button>
					<button type="button" onclick="deleteUser()">삭제</button>
			</td>
			</tr>
		</table>
	</fieldset>
</form>
</div>
<script>
	function deleteUser(){
		if(confirm("삭제하시겠습니까?")){
			location.href="<%=rPath%>/views/testinfo/testDeleteOK.jsp?tNo=<%=tNo%>";
		}
	}
	function checkVal(){
		var objs = document.querySelectorAll('input');
		for(var i=0;i<objs.length;i++){
			if(objs[i].type!="number"){
				if(objs[i].value.length<1 || objs[i].length>100){
					alert(objs[i].name + "의 값을 확인해주세요.");
					objs[i].focus();
					return false;
				}
			}
		}
		
		return true;
	}
</script>
</body>
</html>