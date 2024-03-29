<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="_home" value="active"/>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title></title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <!-- css -->
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
    <section id="featured">
      <!-- start slider -->
      <!-- Slider -->
      <div id="nivo-slider">
        <div class="nivo-slider">
          <!-- Slide #1 image -->
          <img src="static/img/slides/nivo/bg-1.jpg" alt="" title="#caption-1" />
          <!-- Slide #2 image -->
          <img src="static/img/slides/nivo/bg-2.jpg" alt="" title="#caption-2" />
          <!-- Slide #3 image -->
          <img src="static/img/slides/nivo/bg-3.jpg" alt="" title="#caption-3" />
        </div>
        <div class="container">
          <div class="row">
            <div class="span12">
              <!-- Slide #1 caption -->
              
              <div class="nivo-caption" id="caption-1">
                <div>
                  <h2>Your favorite <strong>NFL Players</strong></h2><br>
                  <h2>From your favorite <strong>College</strong></h2><br>
                  <p>
                     Choose from any college with an active NFL player.<br>
                     Get instant stats and updates on the players from that college.
                  </p>
                  <a href="register" class="btn btn-theme">Try it now</a>
                </div>
              </div>
              <!-- Slide #2 caption -->
              <div class="nivo-caption" id="caption-2">
                <div>
                   <h2>MyAlumni<strong>Roster</strong></h2>
                  <p>
                    Sack the time it takes to stay up to speed on your guys.
                  </p>
                  <a href="register" class="btn btn-theme">Try it now</a>
                </div>
              </div>
              <!-- Slide #3 caption -->
              <div class="nivo-caption" id="caption-3">
                <div>
                  <h2>MyAlumni<strong>Roster</strong></h2>
                  <p>
                   Lazy football fandom done right!
                  </p>
                  <a href="register" class="btn btn-theme">Try it now</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- end slider -->
    </section>
   <!--  <section class="callaction">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="big-cta">
              <div class="cta-text">
                <h3>We've created more than <span class="highlight"><strong>5000 websites</strong></span> this year!</h3>
              </div>
              <div class="cta floatright">
                <a class="btn btn-large btn-theme btn-rounded" href="#">Request a quote</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section id="content">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="row">
              <div class="span3">
                <div class="box aligncenter">
                  <div class="aligncenter icon">
                    <i class="icon-briefcase icon-circled icon-64 active"></i>
                  </div>
                  <div class="text">
                    <h6>Corporate business</h6>
                    <p>
                      Lorem ipsum dolor sit amet, has ei ipsum scaevola deseruisse am sea facilisis.
                    </p>
                    <a href="#">Learn more</a>
                  </div>
                </div>
              </div>
              <div class="span3">
                <div class="box aligncenter">
                  <div class="aligncenter icon">
                    <i class="icon-desktop icon-circled icon-64 active"></i>
                  </div>
                  <div class="text">
                    <h6>Responsive theme</h6>
                    <p>
                      Lorem ipsum dolor sit amet, has ei ipsum scaevola deseruisse am sea facilisis.
                    </p>
                    <a href="#">Learn more</a>
                  </div>
                </div>
              </div>
              <div class="span3">
                <div class="box aligncenter">
                  <div class="aligncenter icon">
                    <i class="icon-beaker icon-circled icon-64 active"></i>
                  </div>
                  <div class="text">
                    <h6>Coded carefully</h6>
                    <p>
                      Lorem ipsum dolor sit amet, has ei ipsum scaevola deseruisse am sea facilisis.
                    </p>
                    <a href="#">Learn more</a>
                  </div>
                </div>
              </div>
              <div class="span3">
                <div class="box aligncenter">
                  <div class="aligncenter icon">
                    <i class="icon-coffee icon-circled icon-64 active"></i>
                  </div>
                  <div class="text">
                    <h6>Sit and enjoy</h6>
                    <p>
                      Lorem ipsum dolor sit amet, has ei ipsum scaevola deseruisse am sea facilisis.
                    </p>
                    <a href="#">Learn more</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div> -->
     <!--    <!-- divider -->
 <!--        <div class="row">
          <div class="span12">
            <div class="solidline">
            </div>
          </div>
        </div>
        end divider
        Portfolio Projects
        <div class="row">
          <div class="span12">
            <h4 class="heading">Some of recent <strong>works</strong></h4>
            <div class="row">
              <section id="projects">
                <ul id="thumbs" class="portfolio">
                  Item Project and Filter Name
                  <li class="item-thumbs span3 design" data-id="id-0" data-type="web">
                    Fancybox - Gallery Enabled - Title - Full Image
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The City" href="img/works/full/image-01-full.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    Thumb Image and Description
                    <img src="static/img/works/thumbs/image-01.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                  </li>
                  End Item Project
                  Item Project and Filter Name
                  <li class="item-thumbs span3 design" data-id="id-1" data-type="icon">
                    Fancybox - Gallery Enabled - Title - Full Image
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Office" href="img/works/full/image-02-full.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    Thumb Image and Description
                    <img src="static/img/works/thumbs/image-02.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                  </li>
                  End Item Project
                  Item Project and Filter Name
                  <li class="item-thumbs span3 photography" data-id="id-2" data-type="illustrator">
                    Fancybox - Gallery Enabled - Title - Full Image
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Mountains" href="img/works/full/image-03-full.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    Thumb Image and Description
                    <img src="static/img/works/thumbs/image-03.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                  </li>
                  End Item Project
                  Item Project and Filter Name
                  <li class="item-thumbs span3 photography" data-id="id-2" data-type="illustrator">
                    Fancybox - Gallery Enabled - Title - Full Image
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Mountains" href="img/works/full/image-04-full.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    Thumb Image and Description
                    <img src="static/img/works/thumbs/image-04.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                  </li>
                  End Item Project
                  Item Project and Filter Name
                  <li class="item-thumbs span3 photography" data-id="id-4" data-type="web">
                    Fancybox - Gallery Enabled - Title - Full Image
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Sea" href="img/works/full/image-05-full.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    Thumb Image and Description
                    <img src="static/img/works/thumbs/image-05.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                  </li>
                  End Item Project
                  Item Project and Filter Name
                  <li class="item-thumbs span3 photography" data-id="id-5" data-type="icon">
                    Fancybox - Gallery Enabled - Title - Full Image
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="Clouds" href="img/works/full/image-06-full.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    Thumb Image and Description
                    <img src="static/img/works/thumbs/image-06.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                  </li>
                  End Item Project
                  Item Project and Filter Name
                  <li class="item-thumbs span3 photography" data-id="id-2" data-type="illustrator">
                    Fancybox - Gallery Enabled - Title - Full Image
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Mountains" href="img/works/full/image-07-full.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    Thumb Image and Description
                    <img src="static/img/works/thumbs/image-07.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                  </li>
                  End Item Project
                  Item Project and Filter Name
                  <li class="item-thumbs span3 design" data-id="id-0" data-type="web">
                    Fancybox - Gallery Enabled - Title - Full Image
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="The Dark" href="img/works/full/image-08-full.jpg">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    Thumb Image and Description
                    <img src="static/img/works/thumbs/image-08.jpg" alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                  </li>
                  End Item Project
                </ul>
              </section>
            </div>
          </div>
        </div>
        End Portfolio Projects
        divider
        <div class="row">
          <div class="span12">
            <div class="solidline">
            </div>
          </div>
        </div>
        end divider
        <div class="row">
          <div class="span12">
            <h4>Very satisfied <strong>clients</strong></h4>
            <ul id="mycarousel" class="jcarousel-skin-tango recent-jcarousel clients">
              <li>
                <a href="#">
					<img src="static/img/dummies/clients/client1.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="static/img/dummies/clients/client2.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="static/img/dummies/clients/client3.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="static/img/dummies/clients/client4.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="static/img/dummies/clients/client5.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="static/img/dummies/clients/client6.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="static/img/dummies/clients/client1.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="static/img/dummies/clients/client2.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="static/img/dummies/clients/client3.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="static/img/dummies/clients/client4.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="static/img/dummies/clients/client5.png" class="client-logo" alt="" />
					</a>
              </li>
              <li>
                <a href="#">
					<img src="static/img/dummies/clients/client6.png" class="client-logo" alt="" />
					</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>  -->
    <section id="bottom">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="aligncenter">
              <div id="twitter-wrapper">
                <div id="twitter">
                </div>
              </div>
            </div>
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

  <!-- Template Custom JavaScript File -->
  <script src="static/js/custom.js"></script>
</body>
</html>
