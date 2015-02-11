
<%@ page import="bfcrowd.User" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'colaborator.label', default: 'Colaborator')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-project" class="first">
	<h3>${project.name}</h3>
    <div id="instructions">
        instrucciones
    </div>
    <div id="feedback">
        feedback!
        - Done
        - Already done
        - ?
    </div>
</section>

</body>

</html>
