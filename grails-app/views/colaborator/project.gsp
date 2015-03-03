
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
        <g:form action="saveContribution" class="form-horizontal" role="form" >
        	<g:hiddenField name="recommendationId" value="${recommendation.id}"/>
        	<ul id="feedbackOptions">
	        <li><input type="${recommendation.checkboxMode }" name="state" value="Done" />Done</li>
	        <li><input type="${recommendation.checkboxMode }" name="state" value="Moderated Page" />Moderated Page</li>
	        <li><input type="${recommendation.checkboxMode }" name="state" value="Already Done" />Already Done</li>
	        </ul>
	        <g:submitButton name="save" class="btn btn-primary" value="${message(code: 'default.button.ok.label', default: 'Ok')}" />
        </g:form>
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
