
<%@ page import="wineclub.Wine" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">                                           
		<g:set var="entityName" value="${message(code: 'wine.label', default: 'Wine')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="span2">
				<ul class="nav nav-tabs nav-stacked">
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
			
			<div class="span10">
				<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="name" title="${message(code: 'wine.name.label', default: 'Name')}" />
						
							<g:sortableColumn property="grape" title="${message(code: 'wine.grape.label', default: 'Grape')}" />
						
							<g:sortableColumn property="region" title="${message(code: 'wine.region.label', default: 'Region')}" />
						
							<g:sortableColumn property="year" title="${message(code: 'wine.year.label', default: 'Year')}" />
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${wineInstanceList}" status="i" var="wineInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${wineInstance.id}">${fieldValue(bean: wineInstance, field: "name")}</g:link></td>
						
							<td>${fieldValue(bean: wineInstance, field: "grape")}</td>
						
							<td>${fieldValue(bean: wineInstance, field: "region")}</td>
						
							<td>${fieldValue(bean: wineInstance, field: "year")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${wineInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
