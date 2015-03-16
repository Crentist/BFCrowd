
<%@ page import="bfcrowd.User" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'colaborator.label', default: 'Colaborator')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
	<g:javascript src="autolinker.js" />
</head>

<body>

<section id="show-project" class="first">
	<h3>${project.name}</h3>
	<g:if test="${recommendation}">
    <div id="instructions">
        <h4>Instrucciones:</h4>
        <p id="instruction">${recommendation.instructions }</p>
        <script>document.getElementById('instruction').innerHTML = Autolinker.link( "${recommendation.instructions.encodeAsHTML() }" );</script>
        
    </div>
    <br>
    <div id="feedback">
        <h4>Feedback!</h4>
        <g:form controller="colaborator" class="form-horizontal" role="form" >
        	<g:hiddenField name="recommendationId" value="${recommendation.id}"/>
        	<g:textArea name="text"></g:textArea>
        	<ul id="feedbackOptions">
	        <li><input type="${recommendation.checkboxMode }" name="state" value="Done" />Done</li>
	        <li><input type="${recommendation.checkboxMode }" name="state" value="Moderated Page" />Moderated Page</li>
	        <li><input type="${recommendation.checkboxMode }" name="state" value="Already Done" />Already Done</li>
	        </ul>
	        <g:actionSubmit name="save" action="saveContribution" class="btn btn-primary" value="${message(code: 'default.button.ok.label', default: 'Ok')}" />
	        <g:actionSubmit name="skip" action="skip" class="btn btn-primary" value="${message(code: 'default.button.skip.label', default: 'Skip')}" />
        </g:form>
    </div>
   	</g:if>
	<g:else>
	<div id="emptyProject">
		There are no recommendations to solve.
	</div>
	</g:else>
</section>

</body>

</html>
