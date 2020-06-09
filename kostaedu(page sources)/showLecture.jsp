<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
 
<% ArrayList<String> bcont = (ArrayList<String>)session.getAttribute("bContents"); %>
 
<!DOCTYPE html>
<html lang="ko-kr">
<head>
    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   
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
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
    function fnMove(seq){
        var offset = $("#div" + seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
    </script>
    <script>
    $(document).ready(function(){
          <%if(session.getAttribute("id")!=null){%>
             $("#logbut").attr("data-target","#");
             $("#logbut").attr("data-toggle","#");
             $("#logbut").attr("href","../people/login");
             $('#logspn').html("LogOut");
          <%} else{%>
             $("#logbut").attr("data-target","#login");
            $("#logbut").attr("data-toggle","modal");
            $("#logbut").attr("href","#");
            $('#logspn').html("LogIn");
          <%}%>
          
       });
    </script>
    <style>
        #tb1{
            margin: auto;
            text-align: center;
            width: 800px;
            
        }
        #tb2{
            width: 200px;
        }
        h2 {
        color: blue;
        }
    </style>
</head>
<body class="host_version"> 
 
    <!-- Modal -->
    <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header tit-up">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
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
                        <form action="../people/login" method="post" role="form" class="form-horizontal">
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <input class="form-control" name="id" placeholder="Name" type="text">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <input class="form-control" name="pwd" placeholder="password" type="password">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-light btn-radius btn-brd grd1">
                                        Submit
                                    </button>
                                    <a class="for-pwd" href="javascript:;">Forgot your password?</a>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane" id="Registration">
                        <form action="../people/regis" method="post" role="form" class="form-horizontal"> <!-- form start -->
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <input class="form-control" name="regid" id="id" placeholder="Id" type="text">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <input class="form-control" name="regpwd" id="password" placeholder="Password" type="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <input class="form-control" name="regname" id="name" placeholder="name" type="text">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <input class="form-control" name="regage" id="age" placeholder="age" type="number">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                <input class="form-control" name="regemail" id="email" placeholder="Email" type="email">
                                </div>
                            </div>
                            <div class="form-group">
                        <div class="col-sm-12">
                           <Select name="regsel" placeholder="select" class="form-control">
                           <option value="Student" id="student">Student</option>
                           <option value="Teacher" id="teacher">Teacher</option>
                            </Select>
                        </div>
                     </div>
                            <div class="row">                            
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-light btn-radius btn-brd grd1" value="Save">
                                        Save
                                    </button>    
                                    <button type="button" class="btn btn-light btn-radius btn-brd grd1">
                                        Cancel</button>
                                </div>
                            </div>
                            
                        </form> <!-- form end -->
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
                <a class="navbar-brand" href="index.jsp">
                    <img src="images/kosta2.png" alt="" />
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-host" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbars-host">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#about">ABOUT US</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Course </a>
                            <div class="dropdown-menu" aria-labelledby="dropdown-a">
                               <form action="../lectures/list" method="post">
                                <table>
                                    <tr>
                                        <td><input type="submit" class="dropdown-item" value="SOA" name="crs"></td>
                                        <td><input type="submit" class="dropdown-item" value="SW공학과정" name="crs"></td>
                                    </tr>
                                    <tr>
                                        <td><input type="submit" class="dropdown-item" value="DB과정" name="crs"></td>
                                        <td><input type="submit" class="dropdown-item" value="모바일과정" name="crs"></td>
                                    </tr>
                                    <tr>
                                        <td><input type="submit" class="dropdown-item" value="IoT과정" name="crs"></td>
                                        <td><input type="submit" class="dropdown-item" value="빅데이터과정" name="crs"></td>
                                    </tr>
                                    <tr>
                                        <td><input type="submit" class="dropdown-item" value="인공지능과정" name="crs"></td>
                                        <td><input type="submit" class="dropdown-item" value="비즈니스분석과정" name="crs"></td>
                                    
                                </table>
                                </form>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Community </a>
                            <div class="dropdown-menu" aria-labelledby="dropdown-a">
                                <a class="dropdown-item" href="../question/list">Upload Question </a>
                                <a class="dropdown-item" href="blog.html">Request Lectures/Options</a>
                            </div>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="../notice/list">Question</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Help </a>
                            <div class="dropdown-menu" aria-labelledby="dropdown-a">
                                <a class="dropdown-item" href="FAQ.jsp">FAQ </a>
                                <a class="dropdown-item" href="Location.html">Location</a>
                            </div>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a class="hover-btn-new log orange" href="#" data-toggle="modal" data-target="#login" id="logbut"><span id="logspn">LogIn</span></a></li><!-- log button -->
                    </ul>
                </div>
            </div>
        </nav>
    </header><br><br><br>
    <!-- End header -->
    <!-- ------------------메인내용시작 -->
    <div id="tb1">
           <button type="button" class="btn" onclick="fnMove('0')">교육일정</button>
           <button type="button" class="btn" onclick="fnMove('1')">교육목표</button>
           <button type="button" class="btn" onclick="fnMove('2')">교육내용</button>
           <button type="button" class="btn" onclick="fnMove('3')">교육대상</button>
           <button type="button" class="btn" onclick="fnMove('4')">문의센터</button>
              </div><br><br><br>
      <div class="tab2" style="padding-left: 100px; padding-right:100px;" >
    <div id="div0"><h2><b>교육일정</b></h2><br></div><hr color="blue" style="padding: 1px">
    <table>
        <tr>
            <td align ="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=bcont.get(0) %></td> <!-- kboard -- startdate -->
            <td style="padding-left: 150px"><%=bcont.get(1) %></td> <!-- kboard -- loc -->
            <td style="padding-left: 200px">강사 <%=bcont.get(2)%></td> <!-- klecture -- ktno --> <!-- need to modify kteacherno to kt.name -->
            <td style="padding-left: 400px"><input type="button" value="수강 신청" name="submit"></td> <!-- 수강신쳥에 필요한 테이블 구성 or 테이블 column 재구성 -->
        </tr>
        
        <tr>
        <td>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주간(<%=bcont.get(3) %>시간) <!-- klecture -- lecdur -->
        </td>
        </tr>
    </table>
        <hr color="blue" style="padding: 1px"><br>
       <div id="div1"><h2><b>교육목표</b></h2><br></div> <!-- kboard -- purpose -->
       <%=bcont.get(4) %><hr><br>
   <div id="div2">    <h2><b>교육내용</b></h2></div><br><br> <!-- kboard -- contents -->
    <pre>
    <%=bcont.get(5) %></pre> <hr><br>
    
    <div id="div3"><h2><b>교육대상</b></h2></div><br> <!-- kboard -- ktarget -->
    <pre>
    <%=bcont.get(6) %></pre><hr><br>
    
    <div id="div4"><h2><b>문의센터</b></h2></div><br>
    [판교 교육장] 재직자:031-606-9319, 채용예정자:031-606-9316<br>
    [가산 교육장] 재직자:02-6278-9353, 채용예정자:02-6278-9352<br><br><br><br>
</div>
    <!-- ------------------메인끝 -->
    <div class="parallax section dbcolor">
        <div class="container">
            <div class="row logos">
                <div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
                    <a href="#"><img src="images/logo_01.png" alt="" class="img-repsonsive"></a>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
                    <a href="#"><img src="images/logo_02.png" alt="" class="img-repsonsive"></a>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
                    <a href="#"><img src="images/logo_03.png" alt="" class="img-repsonsive"></a>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
                    <a href="#"><img src="images/logo_04.png" alt="" class="img-repsonsive"></a>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
                    <a href="#"><img src="images/logo_05.png" alt="" class="img-repsonsive"></a>
                </div>
                <div class="col-md-2 col-sm-2 col-xs-6 wow fadeInUp">
                    <a href="#"><img src="images/logo_06.png" alt="" class="img-repsonsive"></a>
                </div>
            </div><!-- end row -->
            
        </div><!-- end container -->
    </div><!-- end section -->
 
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-xs-12">
                    <div class="widget clearfix">
                        <div class="widget-title">
                            <h3>About US</h3>
                        </div>
                        <p> Integer rutrum ligula eu dignissim laoreet. Pellentesque venenatis nibh sed tellus faucibus bibendum. Sed fermentum est vitae rhoncus molestie. Cum sociis natoque penatibus et magnis dis montes.</p>
                        <div class="footer-right">
                            <ul class="footer-links-soi">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-github"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                            </ul><!-- end links -->
                        </div>
                    </div><!-- end clearfix -->
                </div><!-- end col -->
 
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
                        </ul><!-- end links -->
                    </div><!-- end clearfix -->
                </div><!-- end col -->
                
                <div class="col-lg-4 col-md-4 col-xs-12">
                    <div class="widget clearfix">
                        <div class="widget-title">
                            <h3>Contact Details</h3>
                        </div>
 
                        <ul class="footer-links">
                            <li><a href="mailto:#">info@yoursite.com</a></li>
                            <li><a href="#">www.yoursite.com</a></li>
                            <li>PO Box 16122 Collins Street West Victoria 8007 Australia</li>
                            <li>+61 3 8376 6284</li>
                        </ul><!-- end links -->
                    </div><!-- end clearfix -->
                </div><!-- end col -->
                
            </div><!-- end row -->
        </div><!-- end container -->
    </footer><!-- end footer -->
 
    <div class="copyrights">
        <div class="container">
            <div class="footer-distributed">
                <div class="footer-center">                   
                    <p class="footer-company-name">All Rights Reserved. &copy; 2018 <a href="#">SmartEDU</a> Design By : <a href="https://html.design/">html design</a></p>
                </div>
            </div>
        </div><!-- end container -->
    </div><!-- end copyrights -->
 
    <a href="#" id="scroll-to-top" class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>
 
    <!-- ALL JS FILES -->
    <script src="js/all.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/custom.js"></script>
 
</body>
</html>
