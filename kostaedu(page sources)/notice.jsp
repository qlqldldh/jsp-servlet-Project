<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<%!
	ArrayList notList;
%>

<!DOCTYPE html>
<html lang="ko-kr">
<head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>KostaEDU - Education Responsive HTML5 Template</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="style.css">
<!-- ALL VERSION CSS -->
<link rel="stylesheet" href="css/versions.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">

<!-- Modernizer for Portfolio -->
<script src="js/modernizer.js"></script>

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>z
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script>
 	$(document).ready(function(){
 			<%if(session.getAttribute("id")!=null){%>
 				$("#logbut").attr("data-target","#");
 				$("#logbut").attr("data-toggle","#");
 				$("#logbut").attr("href","../people/login");
 				$('#logspn').html("LogOut");
 				<%if(session.getAttribute("id").toString().equals("admin")){%>
 					$('#btnarea').html("<button onclick=\"location.href='writeNotice.jsp'\" id=\"ulbtn\">upload</button>");
 				<%} else {%>
 					$('#btnarea').html("");
 				<%}%>
 			<%} else{%>
 				$("#logbut").attr("data-target","#login");
				$("#logbut").attr("data-toggle","modal");
				$("#logbut").attr("href","#");
				$('#logspn').html("LogIn");
				$('#btnarea').html("");
 			<%}%>
 			
 			<%notList=(ArrayList)session.getAttribute("notlst");%>
 		});
 	
 	
 	</script>
<style>
td, th {
	text-align: center;
}

#ulbtn{
    	margin-top:15px;
    	width:100px;
    	height:40px;
    	border-style:solid;
    	border-radius:8px;
    	
    	background-color:green;
    	color:white;
    	transition:0.5s;
    	/* transition:color 0.5s; */
    }
    
    #ulbtn:hover{
    	background-color:yellow;
    	color:black;
    }
</style>
</head>
<body class="host_version">

	<!-- Modal -->
	<div class="modal fade" id="login" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header tit-up">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Customer Login</h4>
				</div>
				<div class="modal-body customer-box">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" align="center">
						<li><a class="active" href="#Login" data-toggle="tab">Login</a></li>
						<li><a href="#Registration" data-toggle="tab">Registration</a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div class="tab-pane active" id="Login">
							<form action="../people/login" method="post" role="form"
								class="form-horizontal">
								<div class="form-group">
									<div class="col-sm-12">
										<input class="form-control" name="id" placeholder="Name"
											type="text">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<input class="form-control" name="pwd" placeholder="password"
											type="password">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-10">
										<button type="submit"
											class="btn btn-light btn-radius btn-brd grd1">
											Submit</button>
										<a class="for-pwd" href="javascript:;">Forgot your
											password?</a>
									</div>
								</div>
							</form>
						</div>
						<div class="tab-pane" id="Registration">
							<form action="../people/regis" method="post" role="form"
								class="form-horizontal">
								<!-- form start -->
								<div class="form-group">
									<div class="col-sm-12">
										<input class="form-control" name="regid" id="id"
											placeholder="Id" type="text">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<input class="form-control" name="regpwd" id="password"
											placeholder="Password" type="password">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<input class="form-control" name="regname" id="name"
											placeholder="name" type="text">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<input class="form-control" name="regage" id="age"
											placeholder="age" type="number">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<input class="form-control" name="regemail" id="email"
											placeholder="Email" type="email">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">
										<Select name="regsel" placeholder="select"
											class="form-control">
											<option value="Student" id="student">Student</option>
											<option value="Teacher" id="teacher">Teacher</option>
										</Select>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-10">
										<button type="submit"
											class="btn btn-light btn-radius btn-brd grd1" value="Save">
											Save</button>
										<button type="button"
											class="btn btn-light btn-radius btn-brd grd1">
											Cancel</button>
									</div>
								</div>

							</form>
							<!-- form end -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- LOADER -->
	<div id="preloader">
		<div class="loader-container">
			<div class="progress-br float shadow">
				<div class="progress__item"></div>
			</div>
		</div>
	</div>
	<!-- END LOADER -->

	<!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="index.jsp"> <img
					src="images/kosta2.png" alt="" />
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbars-host" aria-controls="navbars-rs-food"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbars-host">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a class="nav-link"
							href="index.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#about">ABOUT
								US</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown-a"
							data-toggle="dropdown">Course </a>
							<div class="dropdown-menu" aria-labelledby="dropdown-a">
								<form action="../lectures/list" method="post">
									<table>
										<tr>
											<td><input type="submit" class="dropdown-item"
												value="SOA" name="crs"></td>
											<td><input type="submit" class="dropdown-item"
												value="SW공학과정" name="crs"></td>
										</tr>
										<tr>
											<td><input type="submit" class="dropdown-item"
												value="DB과정" name="crs"></td>
											<td><input type="submit" class="dropdown-item"
												value="모바일과정" name="crs"></td>
										</tr>
										<tr>
											<td><input type="submit" class="dropdown-item"
												value="IoT과정" name="crs"></td>
											<td><input type="submit" class="dropdown-item"
												value="빅데이터과정" name="crs"></td>
										</tr>
										<tr>
											<td><input type="submit" class="dropdown-item"
												value="인공지능과정" name="crs"></td>
											<td><input type="submit" class="dropdown-item"
												value="비즈니스분석과정" name="crs"></td>
										</tr>
									</table>
								</form>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown-a"
							data-toggle="dropdown">Community </a>
							<div class="dropdown-menu" aria-labelledby="dropdown-a">
								<a class="dropdown-item" href="../question/list">Upload Question </a>
									<a class="dropdown-item" href="blog.html">Request Lectures</a>
							</div></li>
						<li class="nav-item"><a class="nav-link"
							href="../notice/list">Notice</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown-a"
							data-toggle="dropdown">Help </a>
							<div class="dropdown-menu" aria-labelledby="dropdown-a">
								<a class="dropdown-item" href="FAQ.jsp">FAQ </a> <a
									class="dropdown-item" href="Location.html">Location</a>
							</div></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a class="hover-btn-new log orange" href="#"
							data-toggle="modal" data-target="#login" id="logbut"><span
								id="logspn">LogIn</span></a></li>
						<!-- log button -->
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- End header -->

	<div class="all-title-box">
		<div class="container text-center">
			<h1>
				Notice<span class="m_1">공지사항</span>
			</h1>
		</div>
	</div>

	<div id="overviews" class="section wb">
		<div class="container">
			<div class="section-title row text-center">
				<div class="col-md-8 offset-md-2">
					<p class="lead">Notice Informations by Administrator.</p>
				</div>
			</div>
			<!-- end title -->
			<!-- start core -->
			<div>
				<!-- <form action="../notice/detail" method="post"> -->
					<table class="table">
						<tr>
							<th>No.</th>
							<th>Title</th>
							<th>Date</th>
						</tr>

						<% ArrayList<String> temp;
    		for(int i=0;i<notList.size();i++){  temp=(ArrayList<String>)notList.get(i);%>
						<tr>
							<%for(int j=0;j<temp.size();j++) { if(j==1){%>
							<td><a href="../notice/detail?ntcDetail=<%=temp.get(j) %>"><%=temp.get(j) %></a>
								<%} else{%>
							<td><%=temp.get(j) %></td>
							<%} %>
							<%} %>
						</tr>
						<%} %>
						<tr>
						
						<td></td>
						<td></td>
						<td id="btnarea"><button onclick="location.href='writeNotice.jsp'" id="ulbtn">upload</button></td>
						</tr>
					</table>
				<!-- </form> -->
			</div>
			<!-- end core -->
			<br>
			<br>
			<div class="parallax section dbcolor">
				<div class="container">
					<div class="row logos">
						<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
							<a href="#"><img src="images/logo_01.png" alt=""
								class="img-repsonsive"></a>
						</div>
						<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
							<a href="#"><img src="images/logo_02.png" alt=""
								class="img-repsonsive"></a>
						</div>
						<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
							<a href="#"><img src="images/logo_03.png" alt=""
								class="img-repsonsive"></a>
						</div>
						<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
							<a href="#"><img src="images/logo_04.png" alt=""
								class="img-repsonsive"></a>
						</div>
						<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
							<a href="#"><img src="images/logo_05.png" alt=""
								class="img-repsonsive"></a>
						</div>
						<div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
							<a href="#"><img src="images/logo_06.png" alt=""
								class="img-repsonsive"></a>
						</div>
					</div>
					<!-- end row -->
					
				</div>
				</div>
				<!-- end container -->
			</div>
			<!-- end section -->

			<footer class="footer">
				<div class="container">
					<div class="row">
						<div class="col-lg-4 col-md-4 col-xs-12">
							<div class="widget clearfix">
								<div class="widget-title">
									<h3>About US</h3>
								</div>
								<p>Integer rutrum ligula eu dignissim laoreet. Pellentesque
									venenatis nibh sed tellus faucibus bibendum. Sed fermentum est
									vitae rhoncus molestie. Cum sociis natoque penatibus et magnis
									dis montes.</p>
								<div class="footer-right">
									<ul class="footer-links-soi">
										<li><a href="#"><i class="fa fa-facebook"></i></a></li>
										<li><a href="#"><i class="fa fa-github"></i></a></li>
										<li><a href="#"><i class="fa fa-twitter"></i></a></li>
										<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
										<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
									</ul>
									<!-- end links -->
								</div>
							</div>
							<!-- end clearfix -->
						</div>
						<!-- end col -->

						<div class="col-lg-4 col-md-4 col-xs-12">
							<div class="widget clearfix">
								<div class="widget-title">
									<h3>Information Link</h3>
								</div>
								<ul class="footer-links">
									<li><a href="#">Home</a></li>
									<li><a href="#">Blog</a></li>
									<li><a href="#">Pricing</a></li>
									<li><a href="#">About</a></li>
									<li><a href="#">Contact</a></li>
								</ul>
								<!-- end links -->
							</div>
							<!-- end clearfix -->
						</div>
						<!-- end col -->

						<div class="col-lg-4 col-md-4 col-xs-12">
							<div class="widget clearfix">
								<div class="widget-title">
									<h3>Contact Details</h3>
								</div>

								<ul class="footer-links">
									<li><a href="mailto:#">info@yoursite.com</a></li>
									<li><a href="#">www.yoursite.com</a></li>
									<li>PO Box 16122 Collins Street West Victoria 8007
										Australia</li>
									<li>+61 3 8376 6284</li>
								</ul>
								<!-- end links -->
							</div>
							<!-- end clearfix -->
						</div>
						<!-- end col -->

					</div>
					<!-- end row -->
				</div>
				<!-- end container -->
			</footer>
			<!-- end footer -->

			<div class="copyrights">
				<div class="container">
					<div class="footer-distributed">
						<div class="footer-center">
							<p class="footer-company-name">
								All Rights Reserved. &copy; 2018 <a href="#">SmartEDU</a> Design
								By : <a href="https://html.design/">html design</a>
							</p>
						</div>
					</div>
				</div>
				<!-- end container -->
			</div>
			<!-- end copyrights -->

			<a href="#" id="scroll-to-top" class="dmtop global-radius"><i
				class="fa fa-angle-up"></i></a>

			<!-- ALL JS FILES -->
			<script src="js/all.js"></script>
			<!-- ALL PLUGINS -->
			<script src="js/custom.js"></script>
</body>
</html>
