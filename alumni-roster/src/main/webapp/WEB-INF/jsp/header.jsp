<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
	<div class="row"></div>

		
			<div class="span12">


				<!-- Reset Modal -->
				<div id="myReset" class="modal styled hide fade" tabindex="-1"
					role="dialog" aria-labelledby="myResetModalLabel"
					aria-hidden="true">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">�</button>
						<h4 id="myResetModalLabel">
							Reset your <strong>password</strong>
						</h4>
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
								<p class="aligncenter margintop20">We will send instructions
									on how to reset your password to your inbox</p>
							</div>
						</form>
					</div>
				</div>
				<!-- end reset modal -->
			</div>

			<div class="row">
				<div class="span6">
					<div class="logo">
						<a href="index"><img src="static/img/logo.png" alt=""
							class="logo" /></a>
						<h1></h1>
					</div>
				</div>
				<div class="span4">
					<div class="navbar navbar-static-top">
						<div class="navigation">
							<nav>

							</nav>
						</div>
						<!-- end navigation -->
					</div>
				</div>
			</div>
		<!-- </div> -->
</header>