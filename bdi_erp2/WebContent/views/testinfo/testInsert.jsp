<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp" %>
<body>
<div class="container">
<form action="<%=rPath%>/views/testinfo/testInsertOK.jsp" onsubmit="return checkVal()">
	<fieldset>
		<legend>유저 등록</legend>
		<table class="table table-bordered">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="tId"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="tPwd"></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="date" name="tBirth" required></td>
			</tr>
			<tr>
				<th>설명</th>
				<td><textarea name="tContent"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button>유저등록</button>
			</td>
			</tr>
		</table>
	</fieldset>
</form>
</div>
<script>
	
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