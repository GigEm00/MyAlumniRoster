<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Contact Us</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <!-- css -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700" rel="stylesheet">
  <link href="static/css/bootstrap.css" rel="stylesheet" />
  <link href="static/css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="static/css/fancybox/jquery.fancybox.css" rel="stylesheet">
  <link href="static/css/jcarousel.css" rel="stylesheet" />
  <link href="static/css/flexslider.css" rel="stylesheet" />
  <link href="static/css/style.css" rel="stylesheet" />
  <!-- Theme skin -->

  <link href="static/skins/green.css" rel="stylesheet" />
  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="ico/favicon.png" />
  
  </head>

<body>
  <div id="wrapper">

    <!-- start header -->
     <jsp:include page="header.jsp"/>
    <!-- end header -->
    <section id="inner-headline" style="background-color: #274e13;">
      <div class="container" style="background-color: #274e13;">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2>Contact Form</h2>
            </div>
          </div>
          <div class="span8">
       	<ul class="breadcrumb">


							<li><a href="index"><i class="icon-home"></i></a><i
								class="icon-angle-right"></i></li>
							
							<c:if test="${loggedInUser.role eq 'ADMIN' and user.email eq loggedInUser.email}">
								<li class="${_users}"><a href="users">Users </a>
								<i class="icon-angle-right"></i></li>
							</c:if>
							
							<li><a href="about">About Us</a><i class="icon-angle-right"></i></li>
							<c:choose>
								<c:when test="${empty loggedInUser}">
									<li class="${_login}"><a href="login">Login </a><i
										class="icon-angle-right"></i></li>
									<li class="${_register}"><a href="register">Register </a><i
										class="icon-angle-right"></i></li>
								</c:when>
								<c:otherwise>
									<li class="${_profile}"><a
										href="myprofile-${loggedInUser.id}">My Roster </a><i
										class="icon-angle-right"></i></li>
									<li><a href="logout">Logout </a><i
										class="icon-angle-right"></i></li>
								</c:otherwise>
							</c:choose>

						</ul>
          </div>
        </div>
      </div>
    </section> 
    <section id="content">
      <div class="container">
        <div class="row">
          <div class="span12">
            <h4>
            <%-- ${msg} --%><span class="text-danger">${error}</span>
           Send us a            
            <strong>message</strong></h4>

            <form action="sendemail" method="post" role="form" class="contactForm">
              
              <div class="row">
                <div class="span4 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" required/>
                  <div class="validation"></div>
                </div>
                <div class="span4 form-group">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" required />
                  <div class="validation"></div>
                </div>
                <div class="span4 form-group">
                  <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" required/>
                  <div class="validation"></div>
                </div>
                <div class="span12 margintop10 form-group">
                  <textarea class="form-control" name="message" rows="12" data-rule="required" data-msg="Please write something for us" placeholder="Message" required></textarea>
                  <div class="validation"></div>
                  <p class="text-center">
                    <button class="btn btn-large btn-success margintop10" type="submit">Submit message</button>
                  </p>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      
    </section>
     <jsp:include page="footer.jsp"/>
  </div>
  <a href="#" class="scrollup"><i class="icon-chevron-up icon-square icon-32 active"></i></a>
  <!-- javascript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="static/js/jquery.js"></script>
  <script src="static/js/jquery.easing.1.3.js"></script>
  <script src="static/js/bootstrap.js"></script>
  <script src="static/js/jcarousel/jquery.jcarousel.min.js"></script>
  <script src="static/js/jquery.fancybox.pack.js"></script>
  <script src="static/js/jquery.fancybox-media.js"></script>
  <script src="static/js/google-code-prettify/prettify.js"></script>
  <script src="static/js/portfolio/jquery.quicksand.js"></script>
  <script src="static/js/portfolio/setting.js"></script>
  <script src="static/js/jquery.flexslider.js"></script>
  <script src="static/js/jquery.nivo.slider.js"></script>
  <script src="static/js/modernizr.custom.js"></script>
  <script src="static/js/jquery.ba-cond.min.js"></script>
  <script src="static/js/jquery.slitslider.js"></script>
  <script src="static/js/animate.js"></script>

  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Custom JavaScript File -->
  <script src="static/js/custom.js"></script>
</body>

</html>
