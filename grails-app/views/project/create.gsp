<%@ page import="bfcrowd.Project" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
	<title><g:message code="bfcrowd.label.researcher.createProject.create"/></title>
</head>

<body>

	<section id="create-project" class="first">
		<div class="span5">
			<g:hasErrors bean="${projectInstance}">
			<div class="alert alert-danger">
				<g:renderErrors bean="${projectInstance}" as="list" />
			</div>
			</g:hasErrors>
			<h3><g:message code="bfcrowd.label.researcher.createProject.creating"/></h3>
			<g:form action="save" class="form-horizontal" role="form" enctype="multipart/form-data" useToken="true">
				<g:render template="form"/>
	
				<!--  <div class="form-actions margin-top-medium"> -->
					<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'bfcrowd.label.researcher.createProject.create.button', default: 'Create')}" />
		            <button class="btn" type="reset"><g:message code="bfcrowd.label.researcher.createProject.reset.button" default="Reset" /></button>
				<!-- </div> -->

			</g:form>
		</div>

	</section>
<script type="text/javascript">

  $(function() {
    $("#descriptionTip").hide();
    $('#descriptionTipIcon').popover({animation:true, placement:'bottom', title:'A title', content:$('#descriptionTip').html()})
  });
  
  $(function() {
    $("#xpValueTip").hide();
    $('#xpValueTipIcon').popover({animation:true, placement:'bottom', title:'A title', content:$('#xpValueTip').html()})
  });  
  
  $(function() {
    $("#bonusXPTip").hide();
    $('#bonusXPTipIcon').popover({animation:true, placement:'bottom', title:'A title', content:$('#bonusXPTip').html()})
  });
  
  $(function() {
    $("#requiredForBonusTip").hide();
    $('#requiredForBonusTipIcon').popover({animation:true, placement:'bottom', title:'A title', content:$('#requiredForBonusTip').html()})
  });
  
  
</script>		
</body>

</html>
