
<%@ page import="bfcrowd.Recommendation" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'recommendation.label', default: 'Recommendation')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-recommendation" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="date" title="${message(code: 'recommendation.date.label', default: 'Date')}" />
			
				<g:sortableColumn property="fromPage" title="${message(code: 'recommendation.fromPage.label', default: 'From Page')}" />
			
				<g:sortableColumn property="path" title="${message(code: 'recommendation.path.label', default: 'Path')}" />
			
				<th><g:message code="recommendation.project.label" default="Project" /></th>
			
				<g:sortableColumn property="property" title="${message(code: 'recommendation.property.label', default: 'Property')}" />
			
				<g:sortableColumn property="solved" title="${message(code: 'recommendation.solved.label', default: 'Solved')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${recommendationInstanceList}" status="i" var="recommendationInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${recommendationInstance.id}">${fieldValue(bean: recommendationInstance, field: "date")}</g:link></td>
			
				<td>${fieldValue(bean: recommendationInstance, field: "fromPage")}</td>
			
				<td>${fieldValue(bean: recommendationInstance, field: "path")}</td>
			
				<td>${fieldValue(bean: recommendationInstance, field: "project")}</td>
			
				<td>${fieldValue(bean: recommendationInstance, field: "property")}</td>
			
				<td><g:formatBoolean boolean="${recommendationInstance.solved}" /></td>
			
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
