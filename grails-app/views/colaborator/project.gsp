
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
	<g:if test="${recommendation}">
    <div id="instructions">
        <h4>instrucciones</h4>
        <p>${recommendation.instructions }</p>
    </div>
    <br>
    <div id="feedback">
        <h4>feedback!</h4>
        <input type="${recommendation.checkboxMode }" name="state" value="done" />Done<br>
        <input type="${recommendation.checkboxMode }" name="state" value="modified" />Modified Page<br>
        <input type="${recommendation.checkboxMode }" name="state" value="alreadydone" />Already Done<br>
    </div>
   	</g:if>
	<g:else>
	<div id="emptyProject">
		There is no recommendations to solve.
	</div>
	</g:else>
</section>

</body>

</html>
