
<%@ page import="wineclub.Wine" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wine.label', default: 'Wine')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="span2">
				<ul class="nav nav-tabs nav-stacked">
					<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
			<div class="span6">
				<h1>${wineInstance.name} ${wineInstance.year}</h1>
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
			<div class="span4">
				<img src="http://winesfromitaly.com/media/catalog/product/cache/1/image/300x/8a96b66ed6c352a00473260c82658c0c/placeholder/default/generic_bottle_trans_300x300.png"/>
			</div>
		</div>
		<div class="row">
			<div class="offset2 span6">
				<h2>Ratings</h2>
				<g:each in="${wineInstance.ratings}">
					<div class="rating">
						<p>score : ${it.value}</p>
						<p>${it.comment.text}</p>
					</div>
				</g:each>
				<br/>
				<h4>Rate this wine</h4>
				<g:form action="rate">
					<g:hiddenField name="id" value="${wineInstance.id}"/>
					<div>
						<g:textField name="rating" placeholder="Rate this wine"/>
					</div>
					<div>
						<textarea name="comment" placeholder="Comment on this wine"></textarea>
					</div>
					<div>
						<g:submitButton name="submit"/>
					</div>
				</g:form>
			</div>
		</div>	
	</body>
</html>
