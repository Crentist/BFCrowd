<%@ page import="bfcrowd.Project" %>



			<div class="${hasErrors(bean: projectInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="project.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${projectInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: projectInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: projectInstance, field: 'recommendations', 'error')} ">
				<label for="recommendations" class="control-label"><g:message code="project.recommendations.label" default="Recommendations" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${projectInstance?.recommendations?}" var="r">
    <li><g:link controller="recommendation" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="recommendation" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'recommendation.label', default: 'Recommendation')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: projectInstance, field: 'recommendations', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: projectInstance, field: 'users', 'error')} ">
				<label for="users" class="control-label"><g:message code="project.users.label" default="Users" /></label>
				<div>
					
					<span class="help-inline">${hasErrors(bean: projectInstance, field: 'users', 'error')}</span>
				</div>
			</div>

