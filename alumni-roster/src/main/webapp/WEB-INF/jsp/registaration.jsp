<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="_register" value="active" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>MyAlumniRoster-Registration</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- css -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700"
	rel="stylesheet">
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
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="ico/apple-touch-icon-144-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="ico/apple-touch-icon-114-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="ico/apple-touch-icon-72-precomposed.png" />
<link rel="apple-touch-icon-precomposed"
	href="ico/apple-touch-icon-57-precomposed.png" />
<link rel="shortcut icon" href="ico/favicon.png" />

<!-- =======================================================
    Theme Name: Flattern
    Theme URL: https://bootstrapmade.com/flattern-multipurpose-bootstrap-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

<body>
	<div id="wrapper">

		<!-- start header -->
		<jsp:include page="header.jsp" />
		<!-- end header -->
		<section id="inner-headline" style="background-color: #274e13;">
			<div class="container" style="background-color: #274e13;">
				<div class="row">
					<div class="span4">
						<div class="inner-heading">
							<h2>Create Account</h2>
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
							<li class="${_contact}"><a href="contact">Contact </a><i
								class="icon-angle-right"></i></li>
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
					<div class="span6">
						<h3 class="text-center">
							<span class="text-success">Register<br> ${msg}
							</span><span class="text-error">${error}</span>
						</h3>

						<form:form modelAttribute="customers" action="register"
							method="POST" class="form-horizontal">
							<div class="control-group">
								<label class="control-label" for="fname">First Name</label>
								<div class="controls">
									<form:input path="fname" id="f_name" type="text"
										placeholder="first name" />
									<div class="has-error">
										<form:errors path="fname" class="text-error" />
									</div>
								</div>

							</div>
							<div class="control-group">
								<label class="control-label" for="lname">Last Name</label>
								<div class="controls">
									<form:input path="lname" id="l_name" type="text"
										placeholder="last name" />
									<div class="has-error">
										<form:errors path="lname" class="text-error" />
									</div>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="email">Email</label>
								<div class="controls">
									<form:input path="email" id="_email" type="text"
										placeholder="Email" />
									<div class="has-error">
										<form:errors path="email" class="text-error" />
									</div>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="password">Password</label>
								<div class="controls">
									<form:input path="password" id="pass" type="password"
										placeholder="Password" />
									<div class="has-error">
										<form:errors path="password" class="text-error" />
									</div>
								</div>

							</div>
							<div class="control-group">
								<label class="control-label" for="password2">Confirm
									Password</label>
								<div class="controls">
									<form:input path="password2" id="pass2"
										placeholder="Re-enter Password" />
									<div class="has-error">
										<form:errors path="password2" class="text-error" />
									</div>
								</div>

							</div>
							<div class="control-group">
								<div class="controls">
									<button type="submit" id="submit" class="btn">Sign up</button>
								</div>
								<p class="aligncenter margintop20">
									Already have an account? <a href="login">Sign in</a>
								</p>
							</div>
						</form:form>

					</div>
					<div class="span6">
						<!-- start flexslider -->
						<div class="flexslider">
							<ul class="slides">
								<li><img src="static/img/works/full/image-01-full.jpg"
									alt="" /></li>
								<li><img src="static/img/works/full/image-02-full.jpg"
									alt="" /></li>
								<li><img src="static/img/works/full/image-03-full.jpg"
									alt="" /></li>
								<li><img src="static/img/works/full/image-04-full.jpg"
									alt="" /></li>
								<li><img src="static/img/works/full/image-05-full.jpg"
									alt="" /></li>
								<li><img src="static/img/works/full/image-06-full.jpg"
									alt="" /></li>
								<li><img src="static/img/works/full/image-07-full.jpg"
									alt="" /></li>
								<li><img src="static/img/works/full/image-08-full.jpg"
									alt="" /></li>
							</ul>
						</div>
						<!-- end flexslider -->
					</div>
				</div>
				<!-- divider -->
				<div class="row">
					<div class="span12">
						<div class="solidline"></div>
					</div>
				</div>
				<!-- end divider -->

			</div>
		</section>
		<jsp:include page="footer.jsp" />
	</div>
	<a href="#" class="scrollup"><i
		class="icon-chevron-up icon-square icon-32 active"></i></a>
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

