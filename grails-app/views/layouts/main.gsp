<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
        <!-- <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css"> -->
   		<r:require modules="bootstrap"/>
		<g:layoutHead/>        
        <r:layoutResources />
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'wineclub.css')}" type="text/css">
	</head>
	<body>
		<div class="container">
			<header class="page-header">
				<div class="pull-right">Sign in</div>
				<span><g:link uri="/">Wine club!</g:link></span>
			</header>
			<div class="navbar">
			  <div class="navbar-inner">
			    <div class="container">
				<ul class="nav">
					<li ${webRequest.controllerName == null ? "class='active'":""}><g:link uri="/">Home</g:link></li>
					<li ${webRequest.controllerName == "wine"? "class='active'":""}><g:link controller="wine">Wines</g:link></li>
					<li ${webRequest.controllerName == "tastingSession"? "class='active'":""}><g:link controller="tastingSession">Tasting sessions</g:link></li>
				</ul>
			    </div>
			  </div>
			</div>
			<g:layoutBody/>
			<div class="footer" role="contentinfo"></div>
			<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
			<g:javascript library="application"/>
	        <r:layoutResources />
        </div>
	</body>
</html>