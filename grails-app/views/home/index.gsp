<html>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="grails.plugin.nimble.core.UserBase"%>
<head>
	<title><g:message code="default.welcome.title" args="[meta(name:'app.name')]"/> </title>
	<meta name="layout" content="kickstart" />
</head>

<body>

	<section id="intro" class="first">
		<h1>Welcome to BFCrowd!</h1>
		<p>
			The collaborative project...
		</p>
		<h2>Let's get started!</h2>
		<p>
			To start collaborating with our project, you must first register an account and provide a valid WikiPedia user. 
			After that you're all set, and you can start requesting for recommendations made by BlueFinder, and fixing
			the related paths in WikiPedia. Thanks for your help!!			
		</p>
		<g:if test="${UserBase.get(SecurityUtils.subject.principal)}">
			<g:link class="btn btn-large btn-primary">Join project</g:link>
		</g:if>
		<g:else>
			<g:link class="btn btn-large btn-primary" controller="auth" action="login">Log in</g:link>
			<br/>
			<br/>
			<g:message code="nimble.label.login.signup.heading"/>
			<g:message code="nimble.label.login.signup.descriptive"/>
			<br/>
			<g:link class="btn btn-large btn-primary" controller="account" action="createuser">Sign up</g:link>
			<g:link controller="user" action="edit" id="${(UserBase.get(SecurityUtils.subject.principal))?.id}">Edit</g:link>
		</g:else>
	</section>


</body>

</html>