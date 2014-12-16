
<%@ page import="bfcrowd.Recommendation" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'recommendation.label', default: 'Recommendation')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-recommendation" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recommendation.date.label" default="Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${recommendationInstance?.date}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recommendation.fromPage.label" default="From Page" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recommendationInstance, field: "fromPage")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recommendation.path.label" default="Path" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recommendationInstance, field: "path")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recommendation.project.label" default="Project" /></td>
				
				<td valign="top" class="value"><g:link controller="project" action="show" id="${recommendationInstance?.project?.id}">${recommendationInstance?.project?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recommendation.property.label" default="Property" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recommendationInstance, field: "property")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recommendation.solved.label" default="Solved" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${recommendationInstance?.solved}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="recommendation.toPage.label" default="To Page" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: recommendationInstance, field: "toPage")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
