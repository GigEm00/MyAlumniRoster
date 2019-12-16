<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="_profile" value="active" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>My Alumni Roster</title>
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
<style>
.card {
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
	padding: 1.5%;
	margin-top: 1.5%;
}

.card-img {
	min-height: 200px !important;
	min-width: 200px !important;
	max-height: 200px !important;
	max-width: 200px !important;
}
</style>
</head>

<body>
	<div id="wrapper">


		<!-- start header -->
		<jsp:include page="header.jsp" />
		<!-- end header -->

		<!-- Green Navigation Bar Nav Items -->
		<section id="inner-headline" style="background-color: #274e13;">
			<div class="container" style="background-color: #274e13;">
				<div class="row">
					<div class="span4">
						<div class="inner-heading">
							<h2>
								<strong>My</strong> Roster
							</h2>
						</div>
					</div>

					<div class="span8">
						<ul class="breadcrumb">
							<li><a href="index"><i class="icon-home"></i></a><i
								class="icon-angle-right"></i></li>
							<c:if
								test="${loggedInUser.role eq 'ADMIN' and user.email eq loggedInUser.email}">
								<li class="${_users}"><a href="users">Users </a><i
									class="icon-angle-right"></i></li>
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
						<h4>
							<i class="icon-user"> </i> <strong>${user.fname}
								${user.lname}</strong>
						</h4>
						<p class="text-info">
							<small>${msg} ${sucess}</small>
						</p>

						<!-- Begin My Roster Tabs -->
						<!-- Begin Tab headings -->
						<ul class="nav nav-tabs bold">

							<c:if test="${user.email eq loggedInUser.email}">
								<li class=""><a href="#one" data-toggle="tab"> <i
										class="icon-pencil"></i>My College
								</a></li>
								<li class=""><a href="#two" data-toggle="tab"> <i
										class="icon-lock"></i>Reset Password
								</a></li>
							</c:if>
						</ul>
						<!-- End Tab Headings -->
						<!-- Begin Tab content -->
						<div class="tab-content">
							<!-- TAB ONE (1) -->
							<div class="tab-pane active" id="one">
								<p>
									${user.fname} ${user.lname} <br> ${user.tel}<br>
									${user.email}
								</p>
								<!-- 	Update Name, Phone -->
								<form:form modelAttribute="customer" action="editUser"
									method="POST" class="form-horizontal">
									<!-- First Name -->
									<div class="control-group">
										<label class="control-label" for="fname">First Name</label>
										<div class="controls">
											<form:input path="fname" value="${user.fname}" type="text"
												id="fname" placeholder="first name" required="true" />
										</div>
									</div>
									<!-- Last Name -->
									<div class="control-group">
										<label class="control-label" for="lname">Last Name</label>
										<div class="controls">
											<form:input path="lname" value="${user.lname}" type="text"
												id="inputEmail" placeholder="last name" required="true" />
										</div>
									</div>
									<!-- Phone number -->
									<div class="control-group">
										<label class="control-label" for="tel">Phone</label>
										<div class="controls">
											<form:input path="tel" value="${user.tel}" id="tel"
												placeholder="Phone" required="true" />
										</div>
									</div>
									<!-- Select a College -->
									<form:input path="id" type="hidden" id="id" value="${user.id}"
										required="true" />
									<div class="control-group">
										<label class="control-label" for="college">Select a
											College</label>
										<div class="controls">

											<form:select path="college" name="college"
												class="form-control input-sm">

												<option value="">Select College</option>

												<c:forEach items="${colleges}" var="college">
													<option value="${college}">${college}</option>
												</c:forEach>
											</form:select>

										</div>
									</div>
									<br>
									<div class="control-group">
										<div class="controls">
											<button type="submit" class="btn btn-info">Update</button>
										</div>

									</div>
								</form:form>
							</div>
							<!-- End Tab ONE (1) -->
							<!-- TAB TWO (2) Reset Password Tab -->
							<div class="tab-pane" id="two">
								<form class="form-horizontal">
									<div class="control-group">
										<label class="control-label" for="inputResetEmail">Email</label>
										<div class="controls">
											<input type="text" id="inputResetEmail" placeholder="Email">
										</div>
									</div>
									<div class="control-group">
										<div class="controls">
											<button type="submit" class="btn">Reset password</button>
										</div>
										<p class="aligncenter margintop20">We will send
											instructions on how to reset your password to your inbox</p>
									</div>
								</form>
							</div>
							<!-- End password Reset TAB TWO (2) -->
						</div>
						<hr>
					</div>
				</div>
			</div>

			<!-- Player Cards -->
			<c:if test="${!empty user.college}">
				<div class="container">
					<h3>
						<strong>${user.college}</strong> Players
					</h3>
					<div class="my-players row">
						<c:forEach var="player" items="${players}">
							<div class="card span4" style="width: 18rem;">
								<img src="${player.player.officialImageSrc}"
									class="card-img-top card-img" alt="image not found" />

								<div class="card-body">
									<h5 class="card-title">${player.player.firstName} <strong>${player.player.lastName}</strong></h5> 
										<h5><strong>${player.player.primaryPosition}, 
										${player.player.currentTeam.abbreviation }</strong></h5>

									<table>
										<caption></caption>
										<thead>
											<tr>
												<th>Draft Info</th>
											</tr>
										</thead>
										<tr>
											<td>Draft Year:</td>
											<td>${player.player.drafted.year}</td>
										</tr>
										<tr>
											<td>Draft Round:</td>
											<td>${player.player.drafted.round}</td>
										</tr>
										<tr>
											<td>Overall Pick:</td>
											<td>${player.player.drafted.overallPick}</td>
										</tr>
										<tr>
											<td>Drafted by:</td>
											<td>${player.player.drafted.team.abbreviation}</td>
										</tr>
										<thead>
											<tr>
												<th>Demographics</th>
											</tr>
										</thead>

										<tr>
											<td>Born:</td>
											<td>${player.player.birthDate}</td>
										</tr>
										<tr>
											<td>Age:</td>
											<td>${player.player.age}</td>
										</tr>
										<tr>
											<td>Height:</td>
											<td>${player.player.height}</td>
										</tr>
										<tr>
											<td>Weight:</td>
											<td>${player.player.weight}</td>
										</tr>
									</table>


								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
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
	<!-- Bar value table script -->




	<!-- Template Custom JavaScript File -->
	<script src="static/js/custom.js"></script>

</body>

</html>
