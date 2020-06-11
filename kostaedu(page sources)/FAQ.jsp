<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
       .list1 {
            list-style: none;
            padding: 0;
        }
        .list1 > li {
            padding: 0;
        }
        .list1-checkbox {
            display: none;
        }
        .title1 {
            padding: 10px;
            margin: 0;
            border-top: 1px solid #ddd;
            background: #f4f4f4;
            cursor: pointer;
            display: block;
            font-size:20px;
             text-align:center;
        }
        .desc1 {
            max-height: 0px;
            overflow: hidden;
            transition: 0.5s;
            font-size:25px;
            padding-left:7px;
            padding-right:7px;
            
        }
        .desc1 > div {
            margin: 10px;
            
        }
        .list1-checkbox:checked + .title1 + .desc1 {
            max-height: 1000px; 
        }
        
        .list1-input {
            color: White;
        }
      </style>
</head>
<body class="host_version"> 
 
    <!-- Modal -->
    <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header tit-up" align="center">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><font face="Merriweather-Bold">Login Page</font></h4>
            </div>
            <div class="modal-body customer-box">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" align="center">
                    <li><a class="active" href="#Login" data-toggle="tab"><font face="Merriweather-Bold">Sign In</font></a></li>
                    <li><a href="#Registration" data-toggle="tab"><font face="Merriweather-Bold">Registration</font></a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane active" id="Login">
                        <form action="../people/login" method="post" role="form" class="form-horizontal">
                            <div class="form-group">
                                <div class="col-sm-12 alignplaceholder">
                                    <input class="form-control" name="id" placeholder="Name" type="text">
                                    </font>
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
                                    <font face="Merriweather-Bold"> Submit </font>
                                    </button>
                                    <a class="for-pwd" href="javascript:;"><font face="Merriweather-Bold">Forgot your password?</font></a>
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
                        <li class="nav-item active"><a class="nav-link" href="index.jsp"><font face="Merriweather-Bold">Home</font></a></li>
                        <li class="nav-item"><a class="nav-link" href="#about"><font face="Merriweather-Bold">ABOUT US</font></a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown"><font face="Merriweather-Bold">Course</font></a>
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
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown"><font face="Merriweather-Bold">Community</font></a>
                            <div class="dropdown-menu" aria-labelledby="dropdown-a">
                                <a class="dropdown-item" href="../question/list"><font face="Merriweather-Bold">Upload Question</font></a>
                                <a class="dropdown-item" href="blog.html"><font face="Merriweather-Bold">Request Lectures</font></a>
                            </div>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="../notice/list"><font face="Merriweather-Bold">Notice</font></a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown"><font face="Merriweather-Bold">Help</font></a>
                            <div class="dropdown-menu" aria-labelledby="dropdown-a">
                                <a class="dropdown-item" href="FAQ.jsp"><font face="Merriweather-Bold">FAQ</font></a>
                                <a class="dropdown-item" href="Location.html"><font face="Merriweather-Bold">Location</font></a>
                            </div>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a class="hover-btn-new log orange" href="#" data-toggle="modal" data-target="#login" id="logbut"><span id="logspn"><font face="Merriweather-Bold">LogIn</font></span></a></li><!-- log button -->
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <!-- End header -->
    
    <div class="all-title-box">
        <div class="container text-center">
            <h1>FAQ<span class="m_1">자주 묻는 질문</span></h1>
        </div>
    </div>
    
    <div id="overviews" class="section wb">
        <div class="container">
            <div class="section-title row text-center">
                <div class="col-md-8 offset-md-2">
                    <p class="lead">reference this page when you don't know something about us</p>
                </div>
            </div><!-- end title -->
      <ul class="list1">
      <li>
        <input type="checkbox" class="list1-checkbox" id="list-input1" />
        <label for="list-input1" class="title1">[회사등록] 회사명 검색이 안될시</label>
        <div class="desc1">
          <div>
               회사등록 요청 안내<br>
            마이프로필 - 회사정보 - 회사명 검색이 안될시 <br>
            <font color="red">가산 02-6278-9354 / 판교 031-606-9337</font>로 연락주시면 안내해드리겠습니다.<br>
            ※회사명은 협회에서 확인절차를 거쳐 등록해드리고 있습니다.<br>
            ※협약 체결은 별도 과정이며, 공지사항 글 참고 부탁드립니다.<br>
            감사합니다.
          </div>
        </div>
      </li>
      <li>
        <input type="checkbox" class="list1-checkbox" id="list-input2" />
        <label for="list-input2" class="title1">국가인적자원개발컨소시엄 협약이란?</label>
        <div class="desc1">
          <div>
            고용노동부가 운영하는 중소기업 재직근로자의 직무능력 향상을 위한 사업으로서,<br> 협회를 중심으로 컨소시엄을 구항하여
            참여기업이 고용보험법에 의해 지원받는 직원능력개발지원금<br>한도액의 일정비율을 사업주훈련 환급
            방식으로 운영기관(협회)에 제공하고 전사 임직원에 대하여 연간 무료로 교욱을 수강할 수 있는 공동 훈련사업<br>
            ※ 단, 회사의 규모에 따라 인원 횟수의 제한이 있음<br>
            
          </div>
        </div>
      </li>
      <li>
        <input type="checkbox" class="list1-checkbox" id="list-input3" />
        <label for="list-input3" class="title1">국가인적자원개발컨소시엄이란?</label>
        <div class="desc1">
          <div>
                    국가인적자원개발컨소시엄
          </div>
        </div>
      </li>
      <li>
        <input type="checkbox" class="list1-checkbox" id="list-input4" />
        <label for="list-input4" class="title1">[가산교육장] 대중교통 이용 및 주차안내</label>
        <div class="desc1">
          <div>
                   주소 : 08506 서울특별시 금천구 가산디지털1로 151 이노플렉스 1차 2층<br>
            주차안내 : 30분 무료 (15분에 500원, 1일 최대 20,000)<br>
            대중교통 : 지하철 1,7호선 가산디지털단지역 5번 출구  5번 출구 50m 앞 횡단보도 건너 이노플렉스1차 건물 2층 (도보 5분 이내)
          </div>
        </div>
      </li>
      <li>
        <input type="checkbox" class="list1-checkbox" id="list-input5" />
        <label for="list-input5" class="title1">[판교교육장] 대중교통 이용 및 주차안내</label>
        <div class="desc1">
          <div>
                 주소 경기도 성남시 분당구 대왕판교로 670길(삼평동 682번지) 유스페이스2 B동 8층<br>
                대중교통 지하철 신분당선 판교역 1번 출구 (도보 10분) ,  판교역 4번 출구에서 마을버스 이용시 하이펙스/H스퀘어에서 하차 (도보 2분)<br>
                주차안내<br>
                주간과정 : 2시간 무료 지원<br>
                야간과정 : 4시간 무료 지원<br>
                주말주차 : 무료<br>
                지원시간 외 시간당 3천원<br>
                ※무료 주차도장은 1일 1회만 사용가능
          </div>
        </div>
      </li>
    </ul>
    
    <br><br>
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
