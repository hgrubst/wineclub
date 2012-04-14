<%@ page import="wineclub.Wine" %>



<div class="fieldcontain ${hasErrors(bean: wineInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="wine.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${wineInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wineInstance, field: 'grape', 'error')} ">
	<label for="grape">
		<g:message code="wine.grape.label" default="Grape" />
		
	</label>
	<g:textField name="grape" value="${wineInstance?.grape}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wineInstance, field: 'region', 'error')} ">
	<label for="region">
		<g:message code="wine.region.label" default="Region" />
		
	</label>
	<g:textField name="region" value="${wineInstance?.region}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wineInstance, field: 'year', 'error')} ">
	<label for="year">
		<g:message code="wine.year.label" default="Year" />
		
	</label>
	<g:textField name="year" value="${wineInstance?.year}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wineInstance, field: 'rating', 'error')} ">
	<label for="rating">
		<g:message code="wine.rating.label" default="Rating" />
		
	</label>
	<g:select name="rating" from="${wineclub.Rating.list()}" multiple="multiple" optionKey="id" size="5" value="${wineInstance?.rating*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wineInstance, field: 'tastingSession', 'error')} required">
	<label for="tastingSession">
		<g:message code="wine.tastingSession.label" default="Tasting Session" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tastingSession" name="tastingSession.id" from="${wineclub.TastingSession.list()}" optionKey="id" required="" value="${wineInstance?.tastingSession?.id}" class="many-to-one"/>
</div>

