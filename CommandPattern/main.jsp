<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body{
	text-align:center;
}
</style>
</head>
<body>

<!-- <button onclick="location.href='main.do'" value="select" name="but">go Select</button><br><br> controller에서 역할 분담
<button onclick="location.href='main.do'" value="insert" name="but">go Insert</button> -->
<form action="main.do" method="post">
<input type="submit" name="but" value="select">
<input type="submit" name="but" value="insert">

</form>

</body>
</html>