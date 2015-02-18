<h3>My projects</h3>

	<br>
	<ul>
		<g:each in="${myProjects}" var="item">
			<li><g:link controller="colaborator" action="project" 
			id="${item.id}">${item.name}</g:link><g:remoteLink 
			action="leaveProjectById" id="${item.id}" update="joinedProjects" 
			before="if(!confirm('Are you sure?')) return false">-</g:remoteLink></li>
		</g:each>
	</ul>
	<br>



<g:formRemote name="joinProject" url="[controller:'colaborator', action:'joinProject']" update="joinedProjects">
    <label for="name">Project name</label><g:textField name="name"/><br/>
    <input type="submit" value="Join"/>
</g:formRemote>

<div id="otherProjects">
		<g:each in="${otherProjects}" var="item">
			<li><g:remoteLink action="joinProjectById" id="${item.id}" update="joinedProjects">+</g:remoteLink>${item.name}</li>
		</g:each>
</div>