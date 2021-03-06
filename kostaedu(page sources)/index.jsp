<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 
    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
 
     <!-- Site Metas -->
    <title>KostaEDU</title>
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
      #ft1, #ft2, #ft3{
      line-height: 10px;
      }
      
       #rep{
       padding-left: 50px;
       padding-bottom: 100px;
       }
       #msg{
       padding-right: 50px;
       }
       
       #msg1{
       padding-left: 50px;
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
    
    <div id="carouselExampleControls" class="carousel slide bs-slider box-slider" data-ride="carousel" data-pause="hover" data-interval="false" >
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleControls" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleControls" data-slide-to="1"></li>
            <li data-target="#carouselExampleControls" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
                <div id="home" class="first-section" style="background-image:url('images/slider-01.jpg');">
                    <div class="dtab">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 text-right">
                                    <div class="big-tagline">
                                        <h2><strong>KostaEDU </strong> Software Education</h2>
                                        <p class="lead">기술진흥 , 인력양성의 대표기관 KOSTA - SW시장 글로벌화 , SW기술 고도화 , SW정책 인재중심 </p>
                                            <a href="#Location.html" class="hover-btn-new"><span>Contact Us</span></a>
                                    </div>
                                </div>
                            </div><!-- end row -->            
                        </div><!-- end container -->
                    </div>
                </div><!-- end section -->
            </div>
            <div class="carousel-item">
                <div id="home" class="first-section" style="background-image:url('images/slider-02.jpg');">
                    <div class="dtab">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 text-left">
                                    <div class="big-tagline">
                                        <h2 data-animation="animated zoomInRight">KostaEDU <strong><br>Advancement of Software</strong></h2>
                                        <p class="lead" data-animation="animated fadeInLeft">대한민국 IT 산업의 새로운 미래를 여는 한국소프트웨어기술진흥협회, KOSTA</p>
                                            <a href="Location.html" class="hover-btn-new"><span>Contact Us</span></a>
                                    </div>
                                </div>
                            </div><!-- end row -->            
                        </div><!-- end container -->
                    </div>
                </div><!-- end section -->
            </div>
            <div class="carousel-item">
                <div id="home" class="first-section" style="background-image:url('images/slider-03.jpg');">
                    <div class="dtab">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 col-sm-12 text-center">
                                    <div class="big-tagline">
                                        <h2 data-animation="animated zoomInRight">Information Technology with<br><strong>Software</strong></h2>
                                        <p class="lead" data-animation="animated fadeInLeft">
                                        한국소프트웨어기술진흥협회가 함께 만들어 드립니다. 대한민국 소프트웨어 기술진흥 및 인력양성 대표기관으로서 ,<br>소프트웨어 기술 고도화로 한국 IT산업의 새로운 미래를 여는 비전을 실천하고 있습니다.
                                        </p>
                                            <a href="Location.html" class="hover-btn-new"><span>Contact Us</span></a>
                                    </div>
                                </div>
                            </div><!-- end row -->            
                        </div><!-- end container -->
                    </div>
                </div><!-- end section -->
            </div>
            <!-- Left Control -->
            <a class="new-effect carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="fa fa-angle-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
 
            <!-- Right Control -->
            <a class="new-effect carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="fa fa-angle-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <br><br><br><br>
    <div id="overviews" class="section wb">
        <div class="container">
            <div class="section-title row text-center">
                <div class="col-md-8 offset-md-2">
                    <h3 id="about"><font face="a포스터B">ABOUT US</font></h3>
                </div>
                        </div><!-- end title -->
        
            <div class="row align-items-center">
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
                    <div class="message-box" id="msg"><br>
                        <h4><b>2020 BEST KostaEDU education school</b></h4>
                        <h2><b>Welcome to KostaEDU</b></h2><br><br>
                        <p>대한민국 소프트웨어 기술진흥 및 인력양성 대표기관으로서<br><br>
                            소프트웨어기술 고도화로 한국 IT산업의 새로운 미래를 여는 <br><br>비전을 실천하고 있습니다.</p>
 
                        <p>저희는 글로벌화 , 고도화 , 인재중심의 비전 및 전략을 갖고있으며,<br><br>
                            이를 실현하기 위해 기술진흥 , 교육훈련 , 인재인증을 하는 <br><br>방식으로 운영하고있습니다.</p>
                            <br><br><br>
 
                    </div><!-- end messagebox -->
                </div><!-- end col -->
                
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
                    <div class="post-media wow fadeIn">
                        <img src="images/rep-img-1.jpg" alt="" class="img-fluid img-rounded" id="rep">
                    </div><!-- end media -->
                </div><!-- end col -->
            </div>
            <div class="row align-items-center">
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
                    <div class="post-media wow fadeIn">
                        <img src="images/article1.PNG" alt="" class="img-fluid img-rounded" style="padding-right: 50px;">
                    </div><!-- end media -->
                </div><!-- end col -->
                
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
                    <div class="message-box" id="msg1">
                        <h3><font face="Merriweather-Bold"><b>2020 PREMIUM KostaEDU education & Certification</b></font></h3>
                        <h4><font face="Merriweather-Bold"><b>Information for Premium Education of Kosta</b></font></h4><br>
                        <font face="NotoSansKR-Medium">
                           신입인력 고용＇채용, 채용박람회,SW경진대회<br><br>
                     SW아키텍트자격인증(KCSA)<br><br>
                     SW분석설계자격인증(KCSM)<br><br>
                     SW기술능력평가시험(KCSE)<br>
                     <br><br></font>
                    </div><!-- end messagebox -->
                </div><!-- end col -->
                
            </div><!-- end row -->
        </div><!-- end container -->
    </div><!-- end section -->
 <br><br><br><br>
    <section class="section lb page-section">
        <div class="container">
             <div class="section-title row text-center">
                <div class="col-md-8 offset-md-2">
                    <font size="7"><font face="a포스터B">OUR HISTORY</font><br>
                    <br>
                    <p class="lead"><font face="NotoSansKR-Medium">대한민국 소프트웨어 기술진흥 및 인력양성 대표기관으로서<br><br>소프트웨어 기술의 고도화로 한국 IT산업의 비전을 실현하고 있습니다.<br><br>
 
저희는 소프트웨어 시장의 글로벌화 , 고도화 , 인재중심의 비전 및 전략을 갖고있으며,<br><br>이를 실행하기 위해 기술진흥 , 교육훈련 , 역량평가를 하는 방식으로 운영하고있습니다.</font></p>
                </div>
            </div><!-- end title -->
            <br>
            <div class="timeline">
                <div class="timeline__wrap">
                    <div class="timeline__items">
                        <div class="timeline__item">
                            <div class="timeline__content img-bg-01">
                                <h2>2016</h2>
                                <p><font face="Merriweather-Bold">IoT & 디지털 경영포럼 창립, SW역량 및 품질간담회 발족</font></p>
                            </div>
                        </div>
                        <div class="timeline__item">
                            <div class="timeline__content img-bg-02">
                                <h2>2015</h2>
                                <p><font face="Merriweather-Bold">- 일학습병형제 경기 지역<br>특구 지원센터 지정<br><br>
                                   - 비지니스애널리스트 포럼(BAPF) 창립</font></p>
                            </div>
                        </div>
                        <div class="timeline__item">
                            <div class="timeline__content img-bg-03">
                                <h2>2014</h2><br>
                                <p><font face="Merriweather-Bold">- 일학습병행제<br>SC / 듀얼공동훈련센터 선정<br><br>
                                    - 산업계 주도 NCS 기반<br>정부 - 산업계 MOU 체결<br><br>
                                    - NCS 컨설팅 사업 수행</font></p>
                            </div>
                        </div>
                        <div class="timeline__item">
                            <div class="timeline__content img-bg-04">
                                <h2>2013 </h2>
                                <p>SEMAT KOREA 창립 총회,<br>OMG 방법론 수립 표준 보급</p>
                            </div>
                        </div>
                        <div class="timeline__item">
                            <div class="timeline__content img-bg-01">
                                <h2>2011</h2>
                                <p>- SSPL(Software & System Product Line) 포럼 구성<br><br>
                                   - SW아키텍트 자격 인증<br>(KSCA) 시행</p>
                            </div>
                        </div>
                        <div class="timeline__item">
                            <div class="timeline__content img-bg-02">
                                <h2>2009</h2>
                                <p>고용노동부<br>교육훈련혁신센터 선정</p>
                            </div>
                        </div>
                        <div class="timeline__item">
                            <div class="timeline__content img-bg-03">
                                <h2>2007</h2>
                                <p> - 고용노동부<br>국가인적자원개발<br>컨소시엄 사업 기간선정<br><br>
                                    - SW아키텍트포럼 창립(2008,<br>SW아키텍트연합회로 재발족)<br><br>
                                    - SW개발자<br>직무능력 평가시험(KCSE)시행</p>
                            </div>
                        </div>
                        <div class="timeline__item">
                            <div class="timeline__content img-bg-04">
                                <h2>1999</h2>
                                <p>-창립 한국소프트웨어컴포넌트 컨소시엄(KCSC)<br><br>정보통신부 CBD(컴포넌트)<br>기술개발 사업</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
    </section>
    <div class="section cl">
    
        <div class="container">
            <div class="row text-left stat-wrap">
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <span data-scroll class="global-radius icon_wrap effect-1 alignleft"><i class="flaticon-study"></i></span>
                    <p class="stat_count">70000</p>
                    <h3>Graduated Students</h3>
                </div><!-- end col -->
 
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <span data-scroll class="global-radius icon_wrap effect-1 alignleft"><i class="flaticon-online"></i></span>
                    <p class="stat_count">627 , 66</p>
                    <h3>Cooperation , Member Companies</h3>
                </div><!-- end col -->
 
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <span data-scroll class="global-radius icon_wrap effect-1 alignleft"><i class="flaticon-years"></i></span>
                    <p class="stat_count">22</p>
                    <h3>Years Completed</h3>
                </div><!-- end col -->
            </div><!-- end row -->
        </div><!-- end container -->
        <br>
    </div><!-- end section -->

    <div id="plan" class="section lb">
        <div class="container">
            <div class="section-title text-center">
                <h3><font face="a포스터B">Recommended Class</font></h3><br>
                <p>These are high-popular classes in Kosta. Choose one of them whether you wanna receive.  </p>
            </div><!-- end title -->
 
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="message-box">
                        <ul class="nav nav-pills nav-stacked" id="myTabs">
                            <li><a class="active" href="#tab1" data-toggle="pill">Free class</a></li>
                            <li><a href="#tab2" data-toggle="pill">Non-Free class</a></li>
                        </ul>
                    </div>
                </div><!-- end col -->
            </div>
 
            
            <hr class="invis">
 
            <div class="row">
                <div class="col-md-12">
                    <div class="tab-content">
                        <div class="tab-pane active fade show" id="tab1">
                            <div class="row text-center">
                                <div class="col-md-4">
                                    <div class="pricing-table pricing-table-highlighted">
                                        <div class="pricing-table-header grd1">
                                            <h2>Java Web</h2>
                                            <h3>Capstone 프로젝트를 활용한<br><strong><font color="gold">MSA</font></strong> 어플리케이션 전문가 양성과정</h3>
                                        </div>
                                        <div class="pricing-table-space"></div>
                                        <div class="pricing-table-features">
                                        <p><i class="fa fa-clock-o"></i> <strong>360</strong> TIMES</p>
                                            <p><i class="fa fa-male"></i> <strong>20</strong> LIMIT</p>
                                            <p><i class="fa fa-calendar-check-o"></i> <strong>180</strong>DAYS</p>
                                            <p><i class="fa fa-map-marker"></i> <strong>GASAN</strong>AREA</p>
                                            <p><i class="fa fa-user"></i> <strong>KIM</strong> TEACHER</p>
                                        </div>
                                        <div class="pricing-table-sign-up">
                                            <a href="#" class="hover-btn-new orange"><span>REGISTER NOW</span></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="pricing-table pricing-table-highlighted">
                                        <div class="pricing-table-header grd1">
                                            <h2>Internet of Things</h2>
                                            <h3><font color="gold">IoT</font> 방법론 기반 개발자 양성과정<br> 디지털 비즈니스 개발자 양성과정</h3>
                                           
                                        </div>
                                        <div class="pricing-table-space"></div>
                                        <div class="pricing-table-features">
                                      <p><i class="fa fa-clock-o"></i> <strong>360</strong> TIMES</p>
                                            <p><i class="fa fa-male"></i> <strong>20</strong> LIMIT</p>
                                            <p><i class="fa fa-calendar-check-o"></i> <strong>180</strong> DAYS</p>
                                            <p><i class="fa fa-map-marker"></i> <strong>PANGYO</strong>AREA</p>
                                            <p><i class="fa fa-user"></i> <strong>LEE</strong>TEACHER</p>
                                        </div>
                                        <div class="pricing-table-sign-up">
                                            <a href="#" class="hover-btn-new orange"><span>REGISTER NOW</span></a>
                                        </div>
                                    </div>
                                </div>
 
                                <div class="col-md-4">
                                    <div class="pricing-table pricing-table-highlighted">
                                        <div class="pricing-table-header grd1">
                                            <h2>Artificial Intelligence</h2>
                                            <h3><font color="gold">시각 인지 지능</font> 기반 AI 프로그래밍<br>
                                            <font color="gold">스마트제조</font> 적용 인공지능 물체 , 영역 검출</h3>
                                        </div>
                                        <div class="pricing-table-space"></div>
                                        <div class="pricing-table-features">
                                  <p><i class="fa fa-clock-o"></i> <strong>360</strong> TIMES</p>
                                            <p><i class="fa fa-male"></i> <strong>20</strong> LIMIT</p>
                                            <p><i class="fa fa-calendar-check-o"></i> <strong>180</strong> DAYS</p>
                                            <p><i class="fa fa-map-marker"></i> <strong>PANGYO</strong>AREA</p>
                                            <p><i class="fa fa-user"></i> <strong>PARK</strong>TEACHER</p>
                                        </div>
                                        <div class="pricing-table-sign-up">
                                            <a href="#" class="hover-btn-new orange"><span>REGISTER NOW</span></a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- end row -->
                        </div><!-- end pane -->
 
                        <div class="tab-pane fade" id="tab2">
                            <div class="row text-center">
                                <div class="col-md-4">
                                    <div class="pricing-table pricing-table-highlighted">
                                        <div class="pricing-table-header grd1">
                                            <h2>EnterPrise</h2>
                                            <h3><font color="gold">XP & Enterprise</font> Agile FrameWork</h3>
                                        </div>
                                        <div class="pricing-table-space"></div>
                                        <div class="pricing-table-features">
                                            <p><i class="fa fa-clock-o"></i> <strong>360</strong> TIMES</p>
                                            <p><i class="fa fa-male"></i> <strong>20</strong> LIMIT</p>
                                            <p><i class="fa fa-calendar-check-o"></i> <strong>180</strong> DAYS</p>
                                            <p><i class="fa fa-map-marker"></i> <strong>GASAN</strong>AREA</p>
                                            <p><i class="fa fa-user"></i> <strong>KIM</strong>TEACHER</p>
                                            <p><i class="fa fa-krw"></i> <strong>400K</strong>MAJOR COMPANY</p>
                                            <p><i class="fa fa-krw"></i> <strong>300K</strong>MINOR COMPANY</p>
                                        </div>
                                        <div class="pricing-table-sign-up">
                                            <a href="#" class="hover-btn-new orange"><span>REGISTER NOW</span></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="pricing-table pricing-table-highlighted">
                                        <div class="pricing-table-header grd1">
                                            <h2>SoftWare Engineering</h2>
                                            <h3><font color="gold">Gamification</font> 활용 프로젝트 의사결정 전문과정</h3>
                                        </div>
                                        <div class="pricing-table-space"></div>
                                        <div class="pricing-table-features">
                                            <p><i class="fa fa-clock-o"></i> <strong>360</strong> TIMES</p>
                                            <p><i class="fa fa-male"></i> <strong>20</strong> LIMIT</p>
                                            <p><i class="fa fa-calendar-check-o"></i> <strong>180</strong> DAYS</p>
                                            <p><i class="fa fa-map-marker"></i> <strong>PANGYO</strong>AREA</p>
                                            <p><i class="fa fa-user"></i> <strong>LEE</strong>TEACHER</p>
                                            <p><i class="fa fa-krw"></i> <strong>400K</strong>MAJOR COMPANY</p>
                                            <p><i class="fa fa-krw"></i> <strong>300K</strong>MINOR COMPANY</p>
                                        </div>
                                        <div class="pricing-table-sign-up">
                                            <a href="#" class="hover-btn-new orange"><span>REGISTER NOW</span></a>
                                        </div>
                                    </div>
                                </div>
 
                                <div class="col-md-4">
                                    <div class="pricing-table pricing-table-highlighted">
                                        <div class="pricing-table-header grd1">
                                            <h2>Cloud</h2>
                                            <h3><font color="gold">Docker</font>를 활용한     <font color="gold">DevOps</font> 실행방안</h3>
                                        </div>
                                        <div class="pricing-table-space"></div>
                                        <div class="pricing-table-features">
                                            <p><i class="fa fa-clock-o"></i> <strong>360</strong> TIMES</p>
                                            <p><i class="fa fa-male"></i> <strong>20</strong> LIMIT</p>
                                            <p><i class="fa fa-calendar-check-o"></i> <strong>180</strong> DAYS</p>
                                            <p><i class="fa fa-map-marker"></i> <strong>GASAN</strong>AREA</p>
                                            <p><i class="fa fa-user"></i> <strong>KIM</strong>TEACHER</p>
                                            <p><i class="fa fa-krw"></i> <strong>400K</strong>MAJOR COMPANY</p>
                                            <p><i class="fa fa-krw"></i> <strong>300K</strong>MINOR COMPANY</p>
                                       </div>
                                        <div class="pricing-table-sign-up">
                                            <a href="#" class="hover-btn-new orange"><span>REGISTER NOW</span></a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- end row -->
                        </div><!-- end pane -->
                    </div><!-- end content -->
                </div><!-- end col -->
            </div><!-- end row -->
        </div><!-- end container -->
    </div><!-- end section -->
 
 
    <div id="testimonials" class="parallax section db parallax-off" style="background-image:url('images/parallax_04.jpg');">
        <div class="container">
            <div class="section-title text-center">
                <h3><font face="a포스터B">Executives</font></h3>
                <p>Lorem ipsum dolor sit aet, consectetur adipisicing lit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
            </div><!-- end title -->
 
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="testi-carousel owl-carousel owl-theme">
                        <div class="testimonial clearfix">
                            <div class="testi-meta">
                                <img src="images/ceo-face.png" alt="" class="img-fluid">
                                <h4>Lee Danhyung </h4>
                            </div>
                            <div class="desc">
                                <h3><i class="fa fa-quote-left"></i> Greetings !</h3>
                                <p class="lead">오늘날 세계경제는 소프트화, 스마트화를 무기로 하는 무한경쟁 체제라 할 수 있습니다.
즉, 소프트웨어(Software) 역량을 키우지 않고는 치열한 글로벌 경쟁에서 생존하기가 어렵습니다.</p>
                            </div>
                            <!-- end testi-meta -->
                        </div>
                        <!-- end testimonial -->
 
                        <div class="testimonial clearfix">
                            <div class="testi-meta">
                                <img src="images/ceo-face2.png" alt="" class="img-fluid">
                                <h4>Park Junsung </h4>
                            </div>
                            <div class="desc">
                                <h3><i class="fa fa-quote-left"></i> Welcome !</h3>
                                <p class="lead">미국과 EU가 지난 세월 다져온 SW 글로벌 역량을 따라갈<br>지혜와 집중력과 근면성이 우리에게 있다고 확신합니다.<br>이제부터 산 / 학 / 연 / 정이 힘을 모아 필수 SW 역량을<br>쌓아가는 과정을 실행에 옮기는 발걸음을 내디뎌야 합니다.</p>
                            </div>
                            <!-- end testi-meta -->
                        </div>
                        <!-- end testimonial -->
 
                        <div class="testimonial clearfix">
                            <div class="testi-meta">
                                <img src="images/10000kyu.png" alt="" class="img-fluid ">
                                <h4>Park 10000Kyu </h4>
                            </div>
                            <div class="desc">
                                <h3><i class="fa fa-quote-left"></i> 10000규 10000규!</h3>
                                <p class="lead">황우석 박사의 복제견 전담 트레이너, 일본군 순사</p>
                            </div>
                            <!-- end testi-meta -->
                        </div>
                       
                    </div><!-- end carousel -->
                </div><!-- end col -->
            </div><!-- end row -->
        </div><!-- end container -->
    </div><!-- end section -->
 
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
                            <h3><font color="orange">INTRODUCTION</font></h3>
                        </div>
                        <div id="ft1">
                        <p> <font size="2">Integer rutrum ligula eu dignissim laoreet. Pellentesque venenatis nibh sed tellus faucibus bibendum. Sed fermentum est vitae rhoncus molestie. Cum sociis natoque penatibus et magnis dis montes.</font></h6></p>   
                        <div class="footer-right">
                            <ul class="footer-links-soi">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-github"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                            </ul><!-- end links -->
                            </div>
                        </div>                        
                    </div><!-- end clearfix -->
                </div><!-- end col -->
                <div class="col-lg-4 col-md-4 col-xs-12">
 
                    <div class="widget clearfix">
                        <div class="widget-title">
                            <h3><font color="orange">INFORMATION LINK</font></h3>
                        </div>
                        <div id="ft2">
                        <ul class="footer-links">
                            <li><a href="#about"><font size="2">About us</font></a></li>
                            <li><a href="#"><font size="2">Courses</font></a></li>
                            <li><a href="#"><font size="2">Community</font></a></li>
                            <li><a href="#"><font size="2">Notice</font></a></li>
                            <li><a href="#"><font size="2">Help</font></a></li>
                        </ul><!-- end links -->
                    </div><!-- end clearfix -->
                </div><!-- end col -->
                </div>
                <div class="col-lg-4 col-md-4 col-xs-12">
                    <div class="widget clearfix">
                        <div class="widget-title">
                            <h3><font color="orange">CONTACT DETAILS</font></h3>
                        </div>    
                      <div id="ft3">
                        <ul class="footer-links">
                            <li><a href="#"><font size="2">info@yoursite.com</font></a></li>
                            <li><a href="#"><font size="2">http://edu.kosta.or.kr</font></a></li>
                            <li><font size="2">경기도 성남시 분당구 삼평동 대왕판교로 670길 (삼평동 682번지) 유스페이스2 B동 8층 © 2019 KOSTA All rights reserved.</font></li>
                            <li><font size="2">판교 :031-606-9337</font></li>
                            <li><font size="2">가산 :02-6278-9354</font></li>
                        </ul><!-- end links -->
                    </div><!-- end clearfix -->
                </div><!-- end col -->
                </div>
            </div><!-- end row -->
        </div><!-- end container -->
    </footer><!-- end footer -->
 
    <div class="copyrights">
        <div class="container">
            <div class="footer-distributed">
                <div class="footer-center">                   
                    <p class="footer-company-name"><font size="2">All Rights Reserved. &copy; 2018 <a href="#">KostaEDU</a> Design By : <a href="https://html.design/">html design</font></a></p>
                </div>
            </div>
        </div><!-- end container -->
    </div><!-- end copyrights -->
    <a href="#" id="scroll-to-top" class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>
 
    <!-- ALL JS FILES -->
    <script src="js/all.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/custom.js"></script>
    <script src="js/timeline.min.js"></script>
    <script>
        timeline(document.querySelectorAll('.timeline'), {
            forceVerticalMode: 700,
            mode: 'horizontal',
            verticalStartPosition: 'left',
            visibleItems: 4
        });
    </script>
</body>
</html>