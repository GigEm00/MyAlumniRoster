<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="_about" value="active" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>About MyAlumniRoster</title>
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
<link href="static/skins/green.css" rel="stylesheet" />
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
		<!-- toggle top area -->
		<div class="hidden-top">
			<div class="hidden-top-inner container">
				<div class="row">
					<div class="span12">
						<ul>
							<li><strong>We are available for any custom works
									this month</strong></li>
							<li>Main office: Springville center X264, Park Ave S.01</li>
							<li>Call us <i class="icon-phone"></i> (123) 456-7890 -
								(123) 555-7891
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- end toggle top area -->
		<!-- start header -->
		<jsp:include page="header.jsp" />
		<!-- end header -->
		<section id="inner-headline" style="background-color: #274e13;">
			<div class="container" style="background-color: #274e13;">
				<div class="row">
					<div class="span4">
						<div class="inner-heading">
							<h2>About us</h2>
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
						<h2>
							Welcome to <strong>MyAlumniRoster</strong>
						</h2>
						<p>We’re huge college football fans here at MyAlumniRoster.
							And just when we really get to know the players on our favorite
							team, some of them head off to the NFL.</p>
						<p>We also love to follow those players’ careers in the NFL.
							But following all those players and keeping track of them is
							hard! We don’t have enough time to stay current on our guys. So
							we invented MyAlumniRoster.</p>
						<p>Sit back and allow us to bring all the news and stats and
							updates on the players from your favorite college right to you,
							real time, here at MyAlumniRoster.</p>
						<p>Sign up for an account and get started now. Being a lazy
							fan was never so much fun!</p>
						<div>
							<p class="aligncenter margintop20">
								<strong>Quickly create an account here! </strong>
								<a href="register" >Create Account (Register)</a>
							</p>
						</div>
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

				<!-- end divider -->

				<!-- divider -->

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

