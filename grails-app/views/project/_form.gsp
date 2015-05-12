<%@ page import="bfcrowd.Project" %>



			<div class="${hasErrors(bean: projectInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="project.name.label" default="Name" /></label>
				<div>
					<g:textField class="form-control" name="name" value="${projectInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: projectInstance, field: 'name', 'error')}</span>
				</div>
			</div>
			
			<div class="${hasErrors(bean: projectInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="project.description.label" default="Description" /></label>
				<div>
					<g:textArea class="form-control" name="description" value="${projectInstance?.description}" rows="5" cols="40"/>
					<span class="help-inline">${hasErrors(bean: projectInstance, field: 'description', 'error')}</span>
				</div>
			</div>
			
			
			<div class="${hasErrors(bean: projectInstance, field: 'xpValue', 'error')} ">
				<label for="name" class="control-label"><g:message code="project.xpValue.label" default="XP Value" /></label>
				<div>
					<g:textField class="form-control" name="xpValue" value="${projectInstance?.xpValue}"/>
					<span class="help-inline">${hasErrors(bean: projectInstance, field: 'xpValue', 'error')}</span>
				</div>
			</div>
			<div class="${hasErrors(bean: projectInstance, field: 'bonusXP', 'error')} ">
				<label for="name" class="control-label"><g:message code="project.bonusXP.label" default="Bonus XP" /></label>
				<div>
					<g:textField class="form-control" name="bonusXP" value="${projectInstance?.bonusXP}"/>
					<span class="help-inline">${hasErrors(bean: projectInstance, field: 'bonusXP', 'error')}</span>
				</div>
			</div>
			<div class="${hasErrors(bean: projectInstance, field: 'requiredForBonus', 'error')} ">
				<label for="name" class="control-label"><g:message code="project.requiredForBonus.label" default="Required For Bonus" /></label>
				<div>
					<g:textField class="form-control" name="requiredForBonus" value="${projectInstance?.requiredForBonus}"/>
					<span class="help-inline">${hasErrors(bean: projectInstance, field: 'requiredForBonus', 'error')}</span>
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

			<div class="${hasErrors(bean: projectInstance, field: 'logo', 'error')} ">
			    <label for="logo">Logo (50K)</label>
			    <input type="file" name="logo" id="logo" />
			    <div style="font-size:0.8em; margin: 1.0em;">
			      For best results, your logo should have a width-to-height ratio of 4:5.
			      For example, if your image is 80 pixels wide, it should be 100 pixels high.
			    </div>
			</div>
    