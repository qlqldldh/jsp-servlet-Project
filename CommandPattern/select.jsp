<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, testPack.*, models.*" %> <!-- dispatcher -->


<%ArrayList<TestVO> arr = (ArrayList<TestVO>)request.getAttribute("sels"); %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body{
	text-align:center;
}
</style>
</head>
<body>

<%for(int i=0;i<arr.size();i++){ %>
	<hr>
	Nums : <%=arr.get(i).getNums() %><br><br>
	ID : <%=arr.get(i).getId() %>
	<hr>
<%} %>


</body>
</html>