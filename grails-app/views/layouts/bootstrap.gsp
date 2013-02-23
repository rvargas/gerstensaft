<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<title><g:message code="default.siteName.label" default="Gerstensaft"/><g:layoutTitle default=""/></title>
		<%-- <meta name="description" content="">
		<meta name="author" content=""> --%>

		<meta name="viewport" content="initial-scale = 1.0">

		<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<r:require modules="scaffolding"/>

		<!-- Le fav and touch icons -->
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		
		<g:layoutHead/>
		<r:layoutResources/>
	</head>

	<body>

		<nav class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					
					<a class="brand" href="${createLink(uri: '/')}"><g:message code="default.siteName.label" default="Gerstensaft"/></a>

					<div class="nav-collapse">
						<ul class="nav">
							<sec:ifAllGranted roles="ROLE_ADMIN">
								<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
									<li<%= c.logicalPropertyName == controllerName ? ' class="active"' : '' %>><g:link controller="${c.logicalPropertyName}"><g:message code="${c.logicalPropertyName + '.label'}" default="${c.naturalName.replaceAll(' Controller','')}" /></g:link></li>
								</g:each>
							</sec:ifAllGranted>
						</ul>
					</div>
				</div>
			</div>
		</nav>
		
		<g:layoutBody/>
		
		<div class="container-fluid">
			<hr>

			<footer>
				<p>&copy; Rafael Vargas 2013</p>
			</footer>
		</div>

		<r:layoutResources/>

	</body>
</html>