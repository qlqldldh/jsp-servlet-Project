<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	$(function(){
		$.ajax({
			type : "post",
			async : "true",
			url : "test/select",
			data : {},
			/* dataType : "json", */
			success : function(json) {
				json = json.replace(/\n/gi,"\\r\\n");
				var obj = JSON.parse(json);
				var lst = obj.test;
				
				var output="";
				for(var i=0;i<lst.length;i++){
					output+="<hr>";
					
					output+="id: ";
					output+=lst[i].id;
					output+=" // nums: ";
					output+=lst[i].nums;
					
				}
				output+="<br>";
				$("#div1").html(output);
			}
		});
	})
</script>
</head>

<body>
<h1>Here is index.jsp Page</h1>
<form action="test/insert" method="post">
Input nums : <input type="text" name="nums"><br>
Input id : <input type="text" name="id">
<input type="submit" value="submit">
</form>


<button id="but1" onclick="fn_click()">click here</button>
<br>
<div id="div1"></div>


</body>
</html>