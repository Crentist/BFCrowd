
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

<div class="row-fluid">
	<div class="span5 offset1">
		<div style="width:90%;height:90px;border-style:solid;border-width:medium;padding: 5px 5px 5px 5px;"> 
			<strong> ${project.name } </strong>
			<p> Project description here ... </p>
	    </div>
	    <br/>
	    <div style="width:90%;min-height:320px;border-style:solid;border-width:medium;padding: 5px 5px 5px 5px;">
			<g:if test="${recommendation}">
		    	<div style="width:100%;height:100%;border-style:solid;border-width:medium;padding: 5px 5px 5px 5px;">
					    	<div id="instructions">
					        <h4>Instrucciones:</h4>
					        <p id="instruction">${recommendation.instructions }</p>
					        <script>document.getElementById('instruction').innerHTML = Autolinker.link( "${recommendation.instructions.encodeAsHTML() }" );</script>
				        </div>
			    </div>
			    <br/>
			    <div id="feedback" style="width:100%;height:100%;border-style:solid;border-width:medium;padding: 5px 5px 5px 5px;">
					<h4>Feedback</h4>
						<g:form controller="colaborator" class="form-horizontal" role="form" class="row-fluid">
							<g:hiddenField name="recommendationId" value="${recommendation.id}"/>
							<div class="span5">
								<ul id="feedbackOptions">
									<li><input type="${recommendation.checkboxMode }" name="state" value="Done" />Done</li>
									<li><input type="${recommendation.checkboxMode }" name="state" value="Moderated Page" />Moderated Page</li>
									<li><input type="${recommendation.checkboxMode }" name="state" value="Already Done" />Already Done</li>
								</ul>
							</div>
							<div class="span6">
								<g:textArea name="text">Additional comments...</g:textArea>	
							</div>
							    
			    
							<br>
							<div class="btn-group" style="float:right;padding-top:5px">
								<g:actionSubmit name="save" action="saveContribution" class="btn btn-primary" value="${message(code: 'default.button.ok.label', default: 'Ok')}" />
								<g:actionSubmit name="skip" action="skip" class="btn btn-primary" value="${message(code: 'default.button.skip.label', default: 'Skip')}"  />
							</div>
							<br>
							<br>
						</g:form>	
				</div>
				
			</g:if>
			<g:else>
				<div id="emptyProject" style="padding-top:50%;padding-bottom:50%">
					<p style="text-align:center">There are no recommendations to solve.</p>
				</div>
			</g:else>			
	    </div>
	</div>

	<div class="span5">
		<div style="width:90%;border-style:solid;border-width:medium;padding: 5px 5px 5px 5px;"> 
			<strong>Mis insignias en ${project.name }</strong>
				<div id="insignias" style="padding: 5px 5px 5px 5px">
				TO DO
				</div>
			<strong>Mis estadísticas en ${project.name }</strong>
				<div id="estadisticas" style="padding: 5px 5px 5px 5px">
					<ul>
						<li>
							Experiencia ganada:
						</li>
						<li>
							Actividad
							<div id="imgActividad" style="height:50px">
							</div>
						</li>
					</ul>
				</div>		
		</div>	
		<br/>
		<div style="width:90%;border-style:solid;border-width:medium;padding: 5px 5px 5px 5px;">
			<strong>Ranking en ${project.name }</strong>
			<table class="table">
			</table>
		</div>
		
	</div>
	
	
	
</div>
</body>

</html>
