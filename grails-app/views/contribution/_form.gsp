<%@ page import="bfcrowd.Contribution" %>



			<div class="${hasErrors(bean: contributionInstance, field: 'date', 'error')} required">
				<label for="date" class="control-label"><g:message code="contribution.date.label" default="Date" /><span class="required-indicator">*</span></label>
				<div>
					<g:datePicker name="date" precision="day"  value="${contributionInstance?.date}"  />
					<span class="help-inline">${hasErrors(bean: contributionInstance, field: 'date', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: contributionInstance, field: 'recomendation', 'error')} required">
				<label for="recomendation" class="control-label"><g:message code="contribution.recomendation.label" default="Recomendation" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="recomendation" name="recomendation.id" from="${bfcrowd.Recommendation.list()}" optionKey="id" required="" value="${contributionInstance?.recomendation?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: contributionInstance, field: 'recomendation', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: contributionInstance, field: 'user', 'error')} required">
				<label for="user" class="control-label"><g:message code="contribution.user.label" default="User" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="user" name="user.id" from="${bfcrowd.User.list()}" optionKey="id" required="" value="${contributionInstance?.user?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: contributionInstance, field: 'user', 'error')}</span>
				</div>
			</div>

