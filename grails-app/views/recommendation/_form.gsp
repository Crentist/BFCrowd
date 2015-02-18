<%@ page import="bfcrowd.Recommendation" %>



			<div class="${hasErrors(bean: recommendationInstance, field: 'checkboxMode', 'error')} required">
				<label for="checkboxMode" class="control-label"><g:message code="recommendation.checkboxMode.label" default="Checkbox Mode" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" name="checkboxMode" from="${recommendationInstance.constraints.checkboxMode.inList}" required="" value="${fieldValue(bean: recommendationInstance, field: 'checkboxMode')}" valueMessagePrefix="recommendation.checkboxMode"/>
					<span class="help-inline">${hasErrors(bean: recommendationInstance, field: 'checkboxMode', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: recommendationInstance, field: 'date', 'error')} required">
				<label for="date" class="control-label"><g:message code="recommendation.date.label" default="Date" /><span class="required-indicator">*</span></label>
				<div>
					<g:datePicker name="date" precision="day"  value="${recommendationInstance?.date}"  />
					<span class="help-inline">${hasErrors(bean: recommendationInstance, field: 'date', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: recommendationInstance, field: 'fromPage', 'error')} ">
				<label for="fromPage" class="control-label"><g:message code="recommendation.fromPage.label" default="From Page" /></label>
				<div>
					<g:textField class="form-control" name="fromPage" value="${recommendationInstance?.fromPage}"/>
					<span class="help-inline">${hasErrors(bean: recommendationInstance, field: 'fromPage', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: recommendationInstance, field: 'instructions', 'error')} ">
				<label for="instructions" class="control-label"><g:message code="recommendation.instructions.label" default="Instructions" /></label>
				<div>
					<g:textField class="form-control" name="instructions" value="${recommendationInstance?.instructions}"/>
					<span class="help-inline">${hasErrors(bean: recommendationInstance, field: 'instructions', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: recommendationInstance, field: 'path', 'error')} ">
				<label for="path" class="control-label"><g:message code="recommendation.path.label" default="Path" /></label>
				<div>
					<g:textField class="form-control" name="path" value="${recommendationInstance?.path}"/>
					<span class="help-inline">${hasErrors(bean: recommendationInstance, field: 'path', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: recommendationInstance, field: 'project', 'error')} required">
				<label for="project" class="control-label"><g:message code="recommendation.project.label" default="Project" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="project" name="project.id" from="${bfcrowd.Project.list()}" optionKey="id" required="" value="${recommendationInstance?.project?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: recommendationInstance, field: 'project', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: recommendationInstance, field: 'property', 'error')} ">
				<label for="property" class="control-label"><g:message code="recommendation.property.label" default="Property" /></label>
				<div>
					<g:textField class="form-control" name="property" value="${recommendationInstance?.property}"/>
					<span class="help-inline">${hasErrors(bean: recommendationInstance, field: 'property', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: recommendationInstance, field: 'solved', 'error')} ">
				<label for="solved" class="control-label"><g:message code="recommendation.solved.label" default="Solved" /></label>
				<div>
					<bs:checkBox name="solved" value="${recommendationInstance?.solved}" />
					<span class="help-inline">${hasErrors(bean: recommendationInstance, field: 'solved', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: recommendationInstance, field: 'toPage', 'error')} ">
				<label for="toPage" class="control-label"><g:message code="recommendation.toPage.label" default="To Page" /></label>
				<div>
					<g:textField class="form-control" name="toPage" value="${recommendationInstance?.toPage}"/>
					<span class="help-inline">${hasErrors(bean: recommendationInstance, field: 'toPage', 'error')}</span>
				</div>
			</div>

