
<%@ page import="bfcrowd.Recommendation" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'recommendation.label', default: 'Recommendation')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-recommendation" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="checkboxMode" title="${message(code: 'recommendation.checkboxMode.label', default: 'Checkbox Mode')}" />
			
				<g:sortableColumn property="date" title="${message(code: 'recommendation.date.label', default: 'Date')}" />
			
				<g:sortableColumn property="fromPage" title="${message(code: 'recommendation.fromPage.label', default: 'From Page')}" />
			
				<g:sortableColumn property="instructions" title="${message(code: 'recommendation.instructions.label', default: 'Instructions')}" />
			
				<g:sortableColumn property="path" title="${message(code: 'recommendation.path.label', default: 'Path')}" />
			
				<th><g:message code="recommendation.project.label" default="Project" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${recommendationInstanceList}" status="i" var="recommendationInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${recommendationInstance.id}">${fieldValue(bean: recommendationInstance, field: "checkboxMode")}</g:link></td>
			
				<td><g:formatDate date="${recommendationInstance.date}" /></td>
			
				<td>${fieldValue(bean: recommendationInstance, field: "fromPage")}</td>
			
				<td>${fieldValue(bean: recommendationInstance, field: "instructions")}</td>
			
				<td>${fieldValue(bean: recommendationInstance, field: "path")}</td>
			
				<td>${fieldValue(bean: recommendationInstance, field: "project")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${recommendationInstanceCount}" />
	</div>
</section>

</body>

</html>
