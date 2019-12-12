<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
      <div class="container">
  <%--       <!-- hidden top area toggle link -->
        <div id="header-hidden-link">
          <a href="#" class="toggle-link" title="Click me you'll get a surprise" data-target=".hidden-top"><i></i>Open</a>
        </div>
        <!-- end toggle link -->
        <div class="row nomargin">
          <div class="span12">
            <div class="headnav">
              <ul>
              <c:choose>
              <c:when test="${empty loggedInUser}">
              <li><a href="#mySignup" data-toggle="modal"><i class="icon-user"></i> Sign up</a></li>
              <li><a href="#mySignin" data-toggle="modal">Sign in</a></li>
              </c:when>
              <c:otherwise>
              <li><a href="logout" ><i class="icon-user"></i> ${loggedInUser.fname.toUpperCase()} | LOGOUT </a></li>
              </c:otherwise>
              </c:choose>
              </ul>
            </div>
            <!-- Signup Modal -->
            <div id="mySignup" class="modal styled hide fade" tabindex="-1" role="dialog" aria-labelledby="mySignupModalLabel" aria-hidden="true">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 id="mySignupModalLabel">Create an <strong>account</strong></h4>
              </div>
              <div class="modal-body">
                 <form:form modelAttribute="customer" action="register" method="POST" class="form-horizontal">
                    <div class="control-group">
                    <label class="control-label" for="fname">First Name</label>
                    <div class="controls">
                      <form:input path="fname"  type="text" placeholder="First Name"/>
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="lname">First Name</label>
                    <div class="controls">
                      <form:input path="lname"  type="text" placeholder="Last Name"/>
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="email">Email</label>
                    <div class="controls">
                      <form:input path="email"  type="text" placeholder="Email" />
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="password">Password</label>
                    <div class="controls">
                      <form:input path="password"  type="password" placeholder="Password"  />
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="password2">Confirm Password</label>
                    <div class="controls">
                      <form:input path="password2"  type="password" placeholder="Re-enter Password"  />
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                      <button type="submit" class="btn">Sign up</button>
                    </div>
                    <p class="aligncenter margintop20">
                      Already have an account? <a href="login" >Sign in</a>
                    </p>
                  </div>
                </form:form>
              </div>
            </div>
            <!-- end signup modal -->
            <!-- Sign in Modal -->
            <div id="mySignin" class="modal styled hide fade" tabindex="-1" role="dialog" aria-labelledby="mySigninModalLabel" aria-hidden="true">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 id="mySigninModalLabel">Login to your <strong>account</strong></h4>
              </div>
              <div class="modal-body">
                <form:form action="login" modelAttribute="customer" method="post" class="form-horizontal">
                  <div class="control-group">
                    <label class="control-label" for="inputText">User Name</label>
                    <div class="controls">
                      <form:input type="email" path="email"  placeholder="Username" required="true"/>
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="inputSigninPassword">Password</label>
                    <div class="controls">
                      <form:input type="password" path="password" placeholder="Password" required="true"/>
                    </div>
                  </div>
                  
                  <div class="control-group">
                    <div class="controls">
                      <button type="submit" class="btn">Sign in</button>
                    </div>
                    <p class="aligncenter margintop20">
                      Forgot password? <a href="#myReset" data-dismiss="modal" aria-hidden="true" data-toggle="modal">Reset</a>
                    </p>
                  </div>
                </form:form>
              </div>
            </div>
            <!-- end signin modal -->
            <!-- Reset Modal -->
            <div id="myReset" class="modal styled hide fade" tabindex="-1" role="dialog" aria-labelledby="myResetModalLabel" aria-hidden="true">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 id="myResetModalLabel">Reset your <strong>password</strong></h4>
              </div>
              <div class="modal-body">
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
                    <p class="aligncenter margintop20">
                      We will send instructions on how to reset your password to your inbox
                    </p>
                  </div>
                </form>
              </div>
            </div>
            <!-- end reset modal --> --%>
          </div>
        </div>
        <div class="row">
          <div class="span6">
            <div class="logo">
              <a href="index"><img src="static/img/logo.png" alt="" class="logo" /></a>
              <h1></h1>
            </div>
          </div>
          <div class="span4">
            <div class="navbar navbar-static-top">
              <div class="navigation">
                <nav>
                  <ul class="nav topnav">
                    <li class="dropdown ${_home}">
                      <a href="index">Home <i class="icon-angle-down"></i></a>
                      <ul class="dropdown-menu">
                        <li><a href="about">About Us</a></li>
                        <li><a href="contact">Contact</a></li>
                        <li><a href="users">Users</a></li>
                      </ul>
                    </li> 
                    <li  class="${_users}">
                      <a href="users">Users </a>
                    </li>              
                    <li  class="${_contact}">
                      <a href="contact">Contact </a>
                    </li>
                    <c:choose>
                    <c:when test="${empty loggedInUser}">
                    <li  class="${_login}" >
                      <a href="login">Login </a>
                    </li>
                    <li  class="${_register}">
                      <a href="register">Register </a>
                    </li>
                    </c:when>
                    <c:otherwise>
                    <li class="${_profile}">
                    <a href="myprofile-${loggedInUser.id}">Profile </a>
                    </li>
                    <li>
                    <a href="logout">Logout </a>
                    </li>                    
                    </c:otherwise>
                    </c:choose>                    
                  </ul>
                </nav>
              </div>
              <!-- end navigation -->
            </div>
          </div>
        </div>
      </div>
    </header>