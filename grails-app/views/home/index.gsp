<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap"/>
	</head>

	<body>
		<div class="container">
			<div class="hero-unit">
				<g:if test="${!flash.siguiente}">
					<h1 class="pagination-centered">¿Quién es el siguiente?</h1>
					<p class="pagination-centered">&nbsp;</p>
					<p class="pagination-centered"><a href="${createLink(controller:'home',action:'generate')}" class="btn btn-primary btn-large">¡QUIERO SABER! »</a></p>
				</g:if>
				<g:else>
					<h1 class="pagination-centered">Felicidades @${flash.siguiente}</h1>
					<h2 class="pagination-centered">Eres el siguiente :-)</h2>
					<p>&nbsp;</p>
				</g:else>
				
			</div>
			
			<div class="row">
				
				<div class="span6">
					<h2>¿Quién ya fue?</h2>
					
					<g:if test="${usersGone}">
					
						<table class="table table-bordered table-striped">
							<tbody>
								<g:each in="${usersGone}">
									<tr>
										<td><g:formatDate date="${it.lastTime}" /></td>
										<td>${fieldValue(bean: it, field: "username")}</td>
									</tr>
								</g:each>
							</tbody>
						</table>
					
					</g:if>
					
					<g:else>
						<h3 class="pagination-centered">¡NADIE!</h3>
					</g:else>
					
				</div>
				
				<div class="span6">
					<h2>¿Quién no ha ido?</h2>
					<table class="table table-bordered table-striped">
						<tbody>
							<g:each in="${usersNotGone}">
								<tr>
									<td>${fieldValue(bean: it, field: "username")}</td>
								</tr>
							</g:each>
						</tbody>
					</table>
				</div>
				
			</div>
			
		</div>
	</body>
</html>