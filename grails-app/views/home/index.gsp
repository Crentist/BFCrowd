<html>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="grails.plugin.nimble.core.UserBase"%>
<%@page import="grails.plugin.nimble.core.Role"%>
<head>
	<title><g:message code="default.welcome.title" args="[meta(name:'app.name')]"/> </title>
	<meta name="layout" content="kickstart" />
</head>

<body>

<div class="container">

	<section style="width:45%;float:left">
		<h1>Welcome to BFCrowd!</h1>
		<p>
			BFCrowd es un proyecto que permite...
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

	</section>
	
	<section style="width:38%;float:right;margin-left:5px">
		<h1>Participar / Proyectos</h1>
		<!-- Listar los proyectos disponibles dentro de recuadros o algo por el estilo -->
		<div style="width:90%;height:90px;border-style:solid;border-width:medium;padding: 5px 5px;"> 
		
			<p> Mejorando Wikipedia </p>
			<p> Ayudanos a agregar información en Wikipedia ... </p>

		
		</div>
	</section>

</div>

</body>

</html>