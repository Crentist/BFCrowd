<!doctype html>
<html>
<head>
<title><g:message code="bfcrowd.label.login.title" /></title>
<r:require modules="nimble-login" />
<r:layoutResources />
</head>
<body>
	<div class="login-container">
		<div class="login-content">
			<h2 class="border-bottom">
				<g:message code="bfcrowd.label.login.signIn" />
			</h2>
			<n:flashembed />
			<g:if test="${registration}">
				<div class="login-options">
					<h4>
						<g:message code="bfcrowd.label.login.signup.heading" />
					</h4>
					<g:message code="bfcrowd.label.login.signup.descriptive" />
					<g:link controller="account" action="createuser">
						<g:message code="bfcrowd.label.login.signup" />
					</g:link>
				</div>
				<div style="text-align: center; margin-bottom: 3px;">
					--
					<g:message code="bfcrowd.label.login.or" />
					--
				</div>
			</g:if>
			<g:form action="signin" name="login-form" method="post">
				<div class="login-input">
					<div class="control-group">
						<div class="controls ">
							<input type="hidden" name="targetUri" value="${targetUri}" /> <input
								type="text" name="username" id="username"
								placeholder="${message(code:'bfcrowd.label.login.username')}">
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<input type="password" name="password" id="password"
								placeholder="${message(code:'bfcrowd.label.login.password')}">
						</div>
					</div>
				</div>
				<div class="login-actions">
					<label class="checkbox" style="display: inline-block;"> <input
						type="checkbox" name="rememberme"> <g:message
							code="bfcrowd.label.login.rememberMe" />
					</label> <span class="pull-right clearfix">
						<button type="submit" class="btn btn-primary">
							<g:message code="bfcrowd.button.login" />
						</button>
					</span>
				</div>

				<div id="border" class="login-options border-top">
					<h4>
						<g:message code="bfcrowd.label.login.forgottenPassword.heading" />
					</h4>
					<g:message code="bfcrowd.label.login.forgottenPassword.descriptive" />
					<g:link controller="account" action="forgottenpassword"
						style="text-transform:lowercase;">
						<g:message code="bfcrowd.label.login.resetPassword" />
					</g:link>
				</div>
			</g:form>

			<div id="border" class="login-options border-top";>

				<h4>
					<g:message code="bfcrowd.label.login.withFB" />
				</h4>

				<div id="login-btn" style="margin-top: 10pt; display: none">
					<a "href="#" onclick="FB.login();" class="btn btn-primary"
						style="text-align: center;">Iniciar Sesi&oacute;n con Facebook</a>
				</div>
				
				<div id="login-controller" style="margin-top: 10pt; display: none">
					Already logged in, these are your personal data
					<g:form class="form-horizontal" controller="userBF" action="signinfb"
						name="signup-form" method="post">

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-4 control-label">Username</label>
							<div class="col-sm-9">
								<input readonly type="text" size="30" id="userName"
									name="username" class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-4 control-label">Full
								name</label>
							<div class="col-sm-9">
								<input readonly type="text" size="30" id="fullName"
									name="fullName">
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-4 control-label">EMail</label>
							<div class="col-sm-9">
								<input readonly type="text" size="30" id="email" name="email" />
							</div>
						</div>

						<div class="login-actions">
							<span class="pull-right clearfix">
								<button type="submit" class="btn btn-primary">
									<g:message
										code="bfcrowd.label.login.registerlogin" />
								</button>
							</span>
						</div>
					</g:form>
				</div>


			</div>
		</div>
		<r:layoutResources />
</body>
</html>