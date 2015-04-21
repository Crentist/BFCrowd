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

<div class="row-fluid">

	<div class="span5 offset1">
		<!-- Proyectos del usuario & resto de proyectos a los cuales unirse (mockup vista de la página de inicio del colaborador, lado izquierdo) -->
		
		<h3> My projects</h3>
			<div id="myProjects">
				<g:render template="/home/myProjects"/>
			</div>
	</div>
	
	<div class="span5">
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
	</div>

</div>

</body>

</html>