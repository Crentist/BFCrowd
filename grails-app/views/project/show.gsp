
<%@ page import="bfcrowd.Project" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>
 
<section id="show-project" class="first">

	<table class="table">
		<tbody>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="project.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: projectInstance, field: "name")}</td>
				
			</tr>
			<tr class="prop">
				<td valign="top" class="description"><g:message code="project.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: projectInstance, field: "description")}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="logo"><g:message code="project.logo.label" default="Logo" /></td>
				
				<td valign="top" class="value">
					<g:if test="${fieldValue(bean: projectInstance, field: "logo")}">
					  <img class="logo" src="${createLink(controller:'project', action:'logo_image', id:projectInstance.ident())}" />
					</g:if>
				</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="xpValue"><g:message code="project.xpValue.label" default="XP Value" /></td>
				
				<td valign="top" class="value">${projectInstance.xpValue}</td>
				
			</tr>
			<tr class="prop">
				<td valign="top" class="bonusXP"><g:message code="project.bonusXP.label" default="Bonus XP" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: projectInstance, field: "bonusXP")}</td>
				
			</tr>
			<tr class="prop">
				<td valign="top" class="requiredForBonus"><g:message code="project.requiredForBonus.label" default="Required For Bonus" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: projectInstance, field: "requiredForBonus")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="project.recommendations.label" default="Recommendations" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${projectInstance?.recommendations}" var="r">
						<li><g:link controller="recommendation" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="project.users.label" default="Users" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${projectInstance?.users}" var="u">
						<li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
