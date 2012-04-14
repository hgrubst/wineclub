
<%@ page import="wineclub.Wine" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wine.label', default: 'Wine')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-wine" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-wine" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list wine">
			
				<g:if test="${wineInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="wine.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${wineInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wineInstance?.grape}">
				<li class="fieldcontain">
					<span id="grape-label" class="property-label"><g:message code="wine.grape.label" default="Grape" /></span>
					
						<span class="property-value" aria-labelledby="grape-label"><g:fieldValue bean="${wineInstance}" field="grape"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wineInstance?.region}">
				<li class="fieldcontain">
					<span id="region-label" class="property-label"><g:message code="wine.region.label" default="Region" /></span>
					
						<span class="property-value" aria-labelledby="region-label"><g:fieldValue bean="${wineInstance}" field="region"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wineInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="wine.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${wineInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wineInstance?.rating}">
				<li class="fieldcontain">
					<span id="rating-label" class="property-label"><g:message code="wine.rating.label" default="Rating" /></span>
					
						<g:each in="${wineInstance.rating}" var="r">
						<span class="property-value" aria-labelledby="rating-label"><g:link controller="rating" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${wineInstance?.tastingSession}">
				<li class="fieldcontain">
					<span id="tastingSession-label" class="property-label"><g:message code="wine.tastingSession.label" default="Tasting Session" /></span>
					
						<span class="property-value" aria-labelledby="tastingSession-label"><g:link controller="tastingSession" action="show" id="${wineInstance?.tastingSession?.id}">${wineInstance?.tastingSession?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${wineInstance?.id}" />
					<g:link class="edit" action="edit" id="${wineInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
