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

	<section style="width:50%;float:left">
		<g:if test="${UserBase.get(SecurityUtils.subject.principal)}">
			<g:set var="currentUser" value="${UserBase.get(SecurityUtils.subject.principal)}" />
			<!-- Proyectos del usuario & resto de proyectos a los cuales unirse (mockup vista de la página de inicio del colaborador, lado izquierdo) -->
			
			<h3> My projects</h3>
				<div id="myProjects">
					<g:render template="/home/myProjects"/>
			</div>
		</g:if>
		<g:else>
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
		</g:else>
	</section>
	
	<section style="width:38%;float:right;margin-left:5px">
		<g:if test="${UserBase.get(SecurityUtils.subject.principal)}">
			<div style="width:90%;height:200px;border-style:solid;border-width:medium"> 
				<h4> Mis insignias </h4>
				<div><!-- Insignias. TO DO --></div>
				
				<br/>
				<h4> Mis logros </h4>
				<div><!-- Logros. TO DO --></div>
				
				<br/>
				<h4> Próxima... </h4>
				<div><!-- Progress bar para la siguiente insignia. TO DO --></div>
			</div>
			<br/>
			<div style="width:90%;height:200px;border-style:solid;border-width:medium"> 
				<h4> Ranking </h4>

			</div>			
		</g:if>
		<g:else>
			<h1>Participar / Proyectos</h1>
			<g:set var="allProjects" value="${Project.getAll()}" />
			<!-- Listar los proyectos disponibles dentro de recuadros o algo por el estilo -->
			<g:each var="proj" in="${allProjects}">
				<div style="width:90%;height:90px;border-style:solid;border-width:medium;padding: 5px 5px 5px 5px;"> 
					<strong> ${proj.name } </strong>
					<p> Project description here ... </p>
				</div>
				<br/>
			</g:each>
		</g:else>
	</section>

</div>

</body>

</html>