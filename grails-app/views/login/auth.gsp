<html>
	<head>
		<meta name='layout' content='bootstrap'/>
		<title><g:message code="springSecurity.login.title"/></title>
	</head>
	
	<body>
	
	<div class="container">
		<div class="row">
			<div class="span4 offset4 well">
				<legend><g:message code="login.title.label" default="Login"/></legend>
	         	
	         	<g:if test='${flash.message}'> 
		         	<div class="alert alert-error">
						<a class="close" data-dismiss="alert" href="#">×</a>${flash.message}
					</div>
				</g:if>
				
				<form action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
					<input type='text' class='span4' name='j_username' id='username' placeholder="Username"/>
					<input type='password' class='span4' name='j_password' id='password' placeholder="Password"/>
					<label class="checkbox">
						<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/> <g:message code="springSecurity.login.remember.me.label"/>
					</label>
					<g:recaptchaLogin/>
					<button type="submit" name="submit" class="btn btn-info btn-block"><g:message code="login.signinbutton.label" default="Sign in"/></button>
				</form>    
			</div>
		</div>
	</div>
	<script type='text/javascript'>
		<!--
		(function() {
			document.forms['loginForm'].elements['j_username'].focus();
		})();
		// -->
	</script>
	</body>
</html>
