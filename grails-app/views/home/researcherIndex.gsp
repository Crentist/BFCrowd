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

<g:set var="currentUser" value="${UserBase.get(SecurityUtils.subject.principal)}" />
<div class="row-fluid">
	<div class="span5 offset1">
		<div id="createProject">
			<g:link class="btn btn-primary" controller="project" action="create"> <g:message code="bfcrowd.label.researcher.createProject"/> </g:link>
		</div>
		
		<h3> <g:message code="bfcrowd.label.researcher.myProjects"/> </h3>
			<g:if test="${currentUser.getOwnedProjects()}">
				<g:each var="proj" in="${currentUser.getOwnedProjects()}">
					<div style="width:90%;height:90px;border-style:solid;border-width:medium;padding: 5px 5px 5px 5px;"> 
						<g:link controller="project" action="show" id="${proj.id }"> <strong> ${proj.name } </strong> </g:link>
						<p> ${proj.description}  </p>
					</div>
					<br/>
				</g:each>
			</g:if>
			<g:else>
				<g:message code="bfcrowd.label.researcher.emptyProjectList" />	
			</g:else>
	</div>
	
	<div class="span5">
		<div style="width:90%;height:200px;border-style:solid;border-width:medium"> 
		</div>
		<br/>
		<div style="width:90%;height:200px;border-style:solid;border-width:medium"> 
		</div>			
	</div>

</div>

</body>

</html>