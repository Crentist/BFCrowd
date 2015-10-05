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
		
		<h5> <b>Colaboratorio</b> se basa en los siguentes conceptos clave:</h5>
		<p>
		<ul>
			<li><b>Crowdsourcing</b>: es la delegación de tareas a una multitud de personas, a través de una convocatoria abierta. Tradicionalmente se trata de comunidades online.				
										La particularidad de estas tareas es que no son automatizables, y son relativamente simples.
			</li> 
			<li><b>Ciencia Ciudadana</b>: tipo de crowdsourcing en el cual las actividades científicas son llevadas a cabo por una comunidad de colaboradores. Por un lado, se tiene a los científicos y académicos, y por otro, a ciudadanos comunes sin ningún tipo de preparación científica previa (se los llama <i>ciudadanos científicos</i>)
		
		</ul>
		
		<p><strong>Colaboratorio</strong> es una plataforma web que resuelve la problemática de la logística relacionada a la distribución de una cantidad masiva de tareas.</p>
		
		<p>Podemos plantear como ejemplo una clasificación determinada sobre un conjunto muy grande de imágenes de aves.</p>
		
		<img src="https://cientopolis.lifia.info.unlp.edu.ar/images/images/pilaImagenes.jpg" alt="Foto con pila de imágenes" >
		
		
		<p>Colaboratorio tiene dos tipos de perfiles/roles complementarios:</p>
		
		<ul>
			<li>El <b>investigador</b>, que es el encargado de crear los proyectos y cargar las tareas relacionadas 
			al mismo. En el caso del ejemplo, la idea sería crear un proyecto con un nombre 
			significativo, con una descripción explicativa. Cada tarea estaría formada por una 
			de las imágenes de la pila anterior, junto con instrucciones detallando lo que se 
			desea que se responda sobre la imagen relacionada (en forma de una pregunta simple). 
			También se definen otros parámetros, como los puntos de experiencia obtenidos por colaborar.
			</li> 
			</br>
			</br>
	
			<img src="https://cientopolis.lifia.info.unlp.edu.ar/images/images/creandoProyecto.jpg" alt="Pantalla de creación del proyecto" >
			</br></br>
			<li>El <b>ciudadano científico</b>, que es complementario al rol del investigador. 
			Puede unirse a los proyectos que sean de su interés, y resolver las tareas 
			dentro de los mismos.
			</br>
			</br>
			<img src="https://cientopolis.lifia.info.unlp.edu.ar/images/images/resolviendoTareas.jpg" alt="Pantalla de creación del proyecto" >
			</br></br>
			</li> 
		</ul>
		
		<p>Colaboratorio también está vinculado a dos componentes, uno correspondiente a un sistema de logros, y otro que se vincula con una red social.</p>
		<p>En relación al sistema de logros, cada proyecto dentro de Colaboratorio define las insignias a otorgar, y cómo obtenerlas. Esto, junto con el sistema de puntaje, sirve como motivación para que el usuario siga colaborando. </p>
		<p>Mediante el componente de la red social, es posible la difusión tanto de los diferentes proyectos creados, como de los logros obtenidos por los usuarios.
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