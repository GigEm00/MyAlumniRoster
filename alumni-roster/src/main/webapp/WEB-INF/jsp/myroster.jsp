<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="_profile" value="active"/>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Profile</title>
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
    <!-- toggle top area -->
    <div class="hidden-top">
      <div class="hidden-top-inner container">
        <div class="row">
          <div class="span12">
            <ul>
              <li><strong>We are available for any custom works this month</strong></li>
              <li>Main office: Springville center X264, Park Ave S.01</li>
              <li>Call us <i class="icon-phone"></i> (123) 456-7890 - (123) 555-7891</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- end toggle top area -->
    <!-- start header -->
    <jsp:include page="header.jsp"/>
    
    <!-- end header -->
    <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2>Profile</h2>
            </div>
          </div>
          <div class="span8">
            <ul class="breadcrumb">
              <li class="nav-item text-left">
			    <form class="form-search">
                  <input placeholder="Type something" type="text" class="input-medium search-query">
                  <button type="submit" class="btn btn-square btn-theme">Search</button>
                </form>
			  </li>
              <li><a href="#"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="index">Home</a><i class="icon-angle-right"></i></li>
              <li class="active">Profile</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <section id="content">
      <div class="container">
        <div class="row">
          <div class="span6">
            <h4><i class="icon-user">
            </i> <strong>${user.fname} ${user.lname}</strong>
            <c:if test="${user.email eq loggedInUser.email}">
            <button type="button" class="btn btn-primary btn-rounded" data-toggle="modal" data-target="#addImages">
			 <i class="fas fa-plus"> Upload Images</i> 
			</button>
			</c:if>
            </h4>
                <p class="text-info"><small>${msg} ${sucess}</small></p>
                <ul class="nav nav-tabs bold">
                  <li class="active"><a href="#one" data-toggle="tab">
                  <i class="icon-info-sign"></i> Contact Info</a></li>
                  <c:if test="${user.email eq loggedInUser.email}">
                  <li class=""><a href="#two" data-toggle="tab">
                  <i class="icon-pencil"></i>Update Profile</a></li>
                  <li class=""><a href="#three" data-toggle="tab">
                  <i class="icon-lock"></i>Reset Password</a></li>
                  </c:if>
                  <li class=""><a href="#four" data-toggle="tab"><i class="icon-camera-retro"></i>Images</a></li>
                
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="one">                    
                    <p>
                     First Name: ${user.fname}<br>
                     Last Name: ${user.lname} <br>
                     Phone: ${user.tel}<br> 
                     State: ${user.state} <br>
                     Email: ${user.email}
                    </p>
                  </div>
                  <div class="tab-pane" id="two">
                  <form:form modelAttribute="customer" action="editUser" method="POST" class="form-horizontal">
                  <div class="control-group">
                    <label class="control-label" for="fname">First Name</label>
                    <div class="controls">
                      <form:input path="fname"  value="${user.fname}" type="text" id="fname" placeholder="first name" required="true" />
                    </div>
                    
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="lname">Last Name</label>
                    <div class="controls">
                      <form:input path="lname" value="${user.lname}" type="text" id="inputEmail" placeholder="last name" required="true" />
                    </div>                    
                  </div>
                  
                  <div class="control-group">
                    <label class="control-label" for="tel">Phone</label>
                    <div class="controls">
                      <form:input path="tel" value="${user.tel}" id="tel" placeholder="Phone" required="true" />
                    </div>
                    
                  </div>
                 
                 <form:input path="id"  type="hidden" id="id" value="${user.id}" required="true" />
                 <div class="controls">
                  <form:select path="state" name="state" class="form-control input-sm">
					<c:choose>
					<c:when test="${empty editUser.state}">
					 <option value="${editUser.state}" >Select State</option>
					</c:when> 
					<c:otherwise>
					 <option value="${editUser.state}" >${editUser.state}</option>
					</c:otherwise>
					</c:choose>
					<c:forEach items="${states}" var="state">							 
					 <option value="${state}">${state.id}</option>
					</c:forEach>
					</form:select>
	                </div><br>
	                <div class="control-group">
                    <div class="controls">
                      <button type="submit" class="btn btn-info">Update</button>
                    </div>
                    
                  </div>
                  </form:form>
                  </div>
                  <div class="tab-pane" id="three">
                    <p>
                      Cu cum commodo regione definiebas. Cum ea eros laboramus, audire deseruisse his at, munere aeterno ut quo. Et ius doming causae philosophia, vitae bonorum intellegat usu cu.
                    </p>
                  </div>
                  <div class="tab-pane" id="four">
                  <ul id="thumbs" class="portfolio">
                  <!-- Item Project and Filter Name -->
                  <c:forEach var="item" items="${filesname}" >
                  <li class="item-thumbs span1 design" data-id="id-0" data-type="web">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                    <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="" href="${contextPath}//users//myalumniroster//${user.id}//${item}">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    <!-- Thumb Image and Description -->
                    <img src="${contextPath}//users//myalumniroster//${user.id}//${item}" alt="">
                    
                  </li>
                  </c:forEach>
                  <!-- End Item Project -->
                  </ul>
                  
                  </div>
                  
          </div>
            <hr>
            <h4>More about us</h4>
            <hr>
            <div class="accordion" id="accordion2">
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
							1. What we do </a>
                </div>
                <div id="collapseOne" class="accordion-body collapse">
                  <div class="accordion-inner">
                    <p>
                      Diam alienum oporteat ad vis, latine intellegebat cu his. Ei eros dicam commodo duo, an assum meliore eam. In sed albucius dissentiet. Sit laudem graece malorum ne, at eam omnesque expetenda pertinacia, tale meliore vim ea. Dolore legere deleniti ius
                      at, mea nibh discere perfecto ex. Mea ea iuvaret eripuit, eos no vivendo intellegat definiebas, patrioque eloquentiam eos et.
                    </p>
                  </div>
                </div>
              </div>
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
							2. Work process </a>
                </div>
                <div id="collapseTwo" class="accordion-body collapse">
                  <div class="accordion-inner">
                    <p>
                      Nihil suscipit posidonium eos id. An cetero fierent insolens mel, ex sit rebum falli erroribus. Ius in nemore dolorum officiis. Et vel harum dicant, vix eius persius an. Ex eam malis postea, erat nihil consulatu nam ea. Ex quem dolores euripidis eum,
                      tempor aperiam voluptaria has ad. Ea est persecuti dissentiet voluptatibus, at illum malorum minimum usu eum aeterno tritani.
                    </p>
                  </div>
                </div>
              </div>
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
							3. Quality assurance </a>
                </div>
                <div id="collapseThree" class="accordion-body collapse">
                  <div class="accordion-inner">
                    <p>
                      Vel purto oportere principes ne, ut mel graeco omnesque. Habeo justo congue mei cu, eu est molestie sensibus, oratio tibique ad mei. Admodum consetetur cu eam, nec cu doming prompta inciderint, ne vim ceteros mnesarchum scriptorem. Ex eam malis postea,
                      erat nihil consulatu nam ea. Ex quem dolores euripidis eum, tempor aperiam voluptaria has ad. Et vel harum dicant vix.
                    </p>
                  </div>
                </div>
              </div>
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour">
							4. What we can deliver </a>
                </div>
                <div id="collapseFour" class="accordion-body collapse in">
                  <div class="accordion-inner">
                    <p>
                      Diam alienum oporteat ad vis, latine intellegebat cu his. Ei eros dicam commodo duo, an assum meliore eam. In sed albucius dissentiet. Sit laudem graece malorum ne, at eam omnesque expetenda pertinacia, tale meliore vim ea. Dolore legere deleniti ius
                      at, mea nibh discere perfecto ex. Mea ea iuvaret eripuit, eos no vivendo intellegat definiebas, patrioque eloquentiam eos et.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="span6">
            <!-- start flexslider -->
            <div class="flexslider">              <ul class="slides">
              <c:forEach var="item" items="${filesname}" >
                <li>
                  <img src="${contextPath}//users//myalumniroster//${user.id}//${item}" alt="">
                  <c:if test="${user.email eq loggedInUser.email}">
                  <div class="caption">
					<a href="deleteimage?id=${user.id}&image=${item}" onclick="confirmed(); return false;" title="Delete" >
					Delete <i class="icon-trash"></i>              
					</a>
					<a href="setasprofile?image=${item}&email=${user.email}" title="Set as profile picture" >
					Set As Profile Image <i class="icon-user"></i>             
					</a>
					</div>
				</c:if>
                </li>
              </c:forEach>  
              </ul>
            </div>
            <!-- end flexslider -->
          </div>
        </div>
         </div>
    </section>
     <jsp:include page="footer.jsp"/>
  </div>
  
  <div id="addImages" class="modal styled hide fade" tabindex="-1" role="dialog" aria-labelledby="mySignupModalLabel" aria-hidden="true">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="text-center" id="mySignupModalLabel">Add <strong>Pictures</strong></h4>
              </div>
              <div class="modal-body">                 
	                 <form enctype="multipart/form-data" action="uploadMultipleFiles" method="POST" class="form-horizontal">
		              <div class="control-group">
	                    <div class="controls">
	                    <label>Please select:</label>
	                    <input id="fileInput" type="file" id="one" name="uploadingFiles" multiple required>
	                    </div>
	                    <div class="controls">
	                    <label>Please select:</label>
	                    <input id="fileInput" type="file" id="two" name="uploadingFiles" multiple>
	                    </div>
	                    <div class="controls">
	                    <label>Please select:</label>
	                    <input id="fileInput" type="file" id="three" name="uploadingFiles" multiple>
	                    </div>
	                    <div class="controls">
	                    <label>Please select:</label>
	                    <input id="fileInput" type="file" id="four" name="uploadingFiles" multiple>
	                    </div>
	                    <div class="controls">
	                    <label>Please select:</label>
	                    <input id="fileInput" type="file" id="five" name="uploadingFiles" multiple>
	                    <input type="hidden" name="id" value="${user.id}">
	                    </div>
	                    </div>
	                  
	                  <div class="control-group">
	                    <div class="controls">
	                      <button type="submit" class="btn">Upload</button>
	                    </div>
	                  </div>
	                </form>
              </div>
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
