<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp" %>
<body>
<%
	String age = request.getParameter("age");
	String name = request.getParameter("name");
	String[] hobby = request.getParameterValues("hobby");
	if(age!=null){
		out.print(name + "가 전송한 나이는 " + age + "이구나" + "<br>");

		int num = Integer.parseInt(age);
		if(num < 10){
			out.println("유아 네요<br>");
		} else if(num < 20){
			out.println("10대 네요<br>");
		} else if(num < 30){
			out.println("20대 네요<br>");
		} else if(num < 40){
			out.println("30대 네요<br>");
		} else if(num < 50){
			out.println("40대 네요<br>");
		} else if(num < 60){
			out.println("50대 네요<br>");
		} else if(num >= 60){
			out.println("늙으셧네요<br>");
		}
		out.println("취미는 ");
		for(String h : hobby){
			out.println(h);
		}
	}

	
%>
<form>
	나이 : <input type="text" name="age"><br>
	이름 : <input type="text" name="name"><br>
	취미 : 영화<input type="checkbox" name="hobby" value="영화">
	음악감상<input type="checkbox" name="hobby" value="음악감상">
	게임<input type="checkbox" name="hobby" value="게임">
	독서<input type="checkbox" name="hobby" value="독서">
	<br>
	<button>나이전송</button>
</form>

</body>
</html>