<html>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="grails.plugin.nimble.core.UserBase"%>
<%@page import="grails.plugin.nimble.core.Role"%>
<%@page import="bfcrowd.Project"%>
<head>
	<title><g:message code="default.welcome.title" args="[meta(name:'app.name')]"/> </title>
	<meta name="layout" content="kickstart" />
</head>

<body>

<div class="container">

	<div class="span6">
		<h1><g:message code="bfcrowd.label.welcome"/></h1>
		<p>
			<g:message code="bfcrowd.description.index"/>
		</p>
		<p>
			Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod 
			tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,
			quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
			consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie
			consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto
			odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait
			nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil
			imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem
			insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes
			demonstraverunt lectores legere me lius quod ii legunt saepius.		
		</p>
	</div>
	
	<div class="span5">
		<h1><g:message code="bfcrowd.label.projectList"/></h1>
		<g:set var="allProjects" value="${Project.getAll()}" />
		<!-- Listar los proyectos disponibles dentro de recuadros o algo por el estilo -->
		<g:each var="proj" in="${allProjects}">
			<div class="show-component"> 
				<strong> ${proj.name } </strong>
				<p> ${proj.description } </p>
			</div>
			<br/>
		</g:each>
	</div>

</div>

</body>

</html>