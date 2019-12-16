<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="_users" value="active"/>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>User</title>
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
  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
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
    <section id="inner-headline" style="background-color: #274e13;">
      <div class="container" style="background-color: #274e13;">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2>Users</h2>
              
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
							<li><a href="contact">Contact </a><i class="icon-angle-right"></i></li>
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
        <!-- Default table -->
        <div class="row">
          
          <div class="span12">
            <h4 class="text-success">Users 
            <br>${msg} ${success}
            <c:if test="${list.size() eq 0}">
            <a href="users" class="btn btn-theme btn-large e_rotateIn">Reload</a>
            </c:if>
            </h4>
            <c:if test="${not empty list}">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>UID</th>
                  
                  <th>
                  <input type="text" id="searchnow" 
		             placeholder=" Filter Names (${list.size()}) " 
		             class="form-control"  >
		             <br>
		             Name
                  </th>                  
                  <th>Email</th>
                  <th>Phone</th>
                  <c:if test="${loggedInUser.role eq 'ADMIN'}">
                  <th>
                    Role <i class="icon-lock"></i>
                  </th>
                  <th>
                    Action
                    <i class="icon-trash"></i>
                    <i class="icon-pencil"></i>
                  </th>
                  </c:if>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="item" items="${list}" >
                <tr>
                  <td>
                    ${item.id}
                  </td>
                 
                  <td>
                    ${item.fname} ${item.lname}
                  </td>
                  <td>
                    ${item.email}
                  </td>
                  <td>
                    ${item.tel}
                  </td>
                  <c:if test="${loggedInUser.role eq 'ADMIN'}">
                  <td>
                   <form method="POST" action="editrole" >		    									
						<input type="hidden" name="id" value="${item.id}" />		    	 
						<select onchange="this.form.submit()" name="role" class="form-control">
						<option value="${item.role}">${item.role}</option>
						<option value="USER">USER </option>
						<option value="DBA">DBA</option>
						<option value="ADMIN">ADMIN</option>												  
					 </select>												
				   </form>
                   </td>
                  <td>
                   <a href="edituser?id=${item.id}" class="btn btn-success btn-medium btn-rounded">
                   Edit <i class="icon-pencil"></i></a>
                   <a href="deleteuser-${item.id}" onclick="confirmed(); return false;" 
                   class="btn btn-medium btn-danger">
                   Delete <i class="icon-trash"></i></a>
                   </td>
                   
                  </c:if>
                </tr>
                </c:forEach>
                
              </tbody>
            </table>
            </c:if>
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
   <script>
	    function confirmed(){
            if (confirm('You are about to delete, Do you want to proceed?')) {
                  document.getElementById("del").submit();
                  return true;
	            } else {
	               return false;
	            }
	         }

	    
	    $("#searchnow").keyup(function () {
	        var value = this.value.toLowerCase().trim();

	        $("table tr").each(function (index) {
	            if (!index) return;
	            $(this).find("td").each(function () {
	                var id = $(this).text().toLowerCase().trim();
	                var not_found = (id.indexOf(value) == -1);
	                $(this).closest('tr').toggle(!not_found);
	                return not_found;
	            });
	        });
	    });
	    </script> 
	    
	    <script>
            function updateSize() {
                var nBytes = 0,
                        oFiles = document.getElementById("fileInput").files,
                        nFiles = oFiles.length;
                for (var nFileId = 0; nFileId < nFiles; nFileId++) {
                    nBytes += oFiles[nFileId].size;
                }

                var sOutput = nBytes + " bytes";
                // optional code for multiples approximation
                for (var aMultiples = ["KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB"], nMultiple = 0, nApprox = nBytes / 1024; nApprox > 1; nApprox /= 1024, nMultiple++) {
                    sOutput = nApprox.toFixed(3) + " " + aMultiples[nMultiple] + " (" + nBytes + " bytes)";
                }
                // end of optional code

                document.getElementById("fileNum").innerHTML = nFiles;
                document.getElementById("fileSize").innerHTML = sOutput;
            }
            
            
        </script>
</body>

</html>
