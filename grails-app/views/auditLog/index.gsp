
<%@ page import="me.rafaelvargas.AuditLog" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'auditLog.label', default: 'AuditLog')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="index">
								<i class="icon-list icon-white"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>

			<div class="span9">
				
				<div class="page-header">
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
					<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped" id="listTable">
					<thead>
						<tr>
						
							<th class="header"><g:message code="auditLog.user.label" default="User" /></th>
							
							<th class="header"><g:message code="auditLog.activity.label" default="Activity" /></th>
							
							<th class="header"><g:message code="auditLog.dateCreated.label" default="Date Created" /></th>
							
						</tr>
					</thead>
					<tbody>
					<g:each in="${auditLogInstanceList}" var="auditLogInstance">
						<tr>
							<td>${fieldValue(bean: auditLogInstance.user, field: "username")}</td>
						
							<td>${fieldValue(bean: auditLogInstance, field: "activity")}</td>
						
							<td><g:formatDate date="${auditLogInstance.dateCreated}" /></td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
