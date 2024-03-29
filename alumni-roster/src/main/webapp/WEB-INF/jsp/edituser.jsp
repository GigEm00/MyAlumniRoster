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
  <title></title>
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
  <link href="static/skins/default.css" rel="stylesheet" />
  <!-- boxed bg -->
  <link id="bodybg" href="bodybg/bg1.css" rel="stylesheet" type="text/css" />
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
              <h2>Edit User</h2>
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
							<li><a href="contact">Contact </a><i
								class="icon-angle-right"></i></li>
							<c:choose>
								<c:when test="${empty loggedInUser}">
									<li class="${_login}"><a href="login">Login </a><i
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
          <div class="span6">
           <h3 class="text-center">
              <span class="alert-success">${msg} </span><span class="alert-error">${error}</span>
           </h3>

		  <form:form modelAttribute="customer" action="editUser" method="POST" class="form-horizontal">
                  
                  <div class="control-group">
                    <label class="control-label" for="fname">First Name</label>
                    <div class="controls">
                      <form:input path="fname"  type="text" id="fname" placeholder="first name" required="true" />
                    </div>
                    <div class="has-error">
					  <form:errors path="lname" class="text-danger"/>
					</div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="lname">Last Name</label>
                    <div class="controls">
                      <form:input path="lname"  type="text" id="inputEmail" placeholder="last name" required="true" />
                    </div>
                    <div class="has-error">
					  <form:errors path="lname" class="text-danger"/>
					</div>
                  </div>
                  
                  <div class="control-group">
                    <label class="control-label" for="tel">Phone</label>
                    <div class="controls">
                      <form:input path="tel"  id="tel" placeholder="Phone" required="true" />
                    </div>
                    <div class="has-error">
					  <form:errors path="tel" class="text-danger"/>
					</div>
                  </div>
                  <div class="control-group">
                  <div class="controls">
                
                 </div>
                 </div>
                 <form:input path="id"  type="hidden" id="id" required="true" />
                 
                 <div class="control-group">
                    <div class="controls">
                      <button type="submit" class="btn">Update</button>
                    </div>
                    
                  </div>
                  </form:form>
                
          </div>
          <div class="span6">
            <!-- start flexslider -->
            <div class="flexslider">
              <ul class="slides">
                <li>
                  <img src="static/img/works/full/image-01-full.jpg" alt="" />
                </li>
                <li>
                  <img src="static/img/works/full/image-02-full.jpg" alt="" />
                </li>
                <li>
                  <img src="static/img/works/full/image-03-full.jpg" alt="" />
                </li>
              </ul>
            </div>
            <!-- end flexslider -->
          </div>
        </div>
        <!-- divider -->
        <div class="row">
          <div class="span12">
            <div class="solidline">
            </div>
          </div>
        </div>
         <!-- end divider -->
        
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

  <!-- Template Custom JavaScript File -->
  <script src="static/js/custom.js"></script>

</body>

</html>

