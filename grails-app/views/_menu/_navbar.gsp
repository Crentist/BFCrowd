<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="grails.plugin.nimble.core.UserBase"%>
<nav id="Navbar" class="navbar navbar-fixed-top navbar-inverse" role="navigation">
	<div class="container">
	    <div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
        		<span class="sr-only">Toggle navigation</span>
        		<span class="icon-bar"></span>
	           	<span class="icon-bar"></span>
	           	<span class="icon-bar"></span>
			</button>
		</div>

		<a class="navbar-brand" href="${createLink(uri: '/')}">
			<img class="logo" src="${resource(plugin: 'kickstart', dir:'images', file:'brand_logo.png')}" alt="${meta(name:'app.name')}" width="16px" height="16px"/> 
			${meta(name:'app.name')}
		</a>	
		
		<g:if test="${UserBase.get(SecurityUtils.subject.principal)}">
		<g:set var="currentUser" value="${UserBase.get(SecurityUtils.subject.principal)}" />
				<div class="container-fluid">           
			         <ul class="nav pull-right">
			            <li class="profile dropdown">
			               <a class="dropdown-toggle" href="javascript:" data-toggle="dropdown">
			               ${currentUser?.username}
			               <b class="caret icon-white"></b>                           
			               </a>        
			               <ul class="dropdown-menu">
			                  <!-- <li>
			                     <g:link controller="user" action="show" id="${currentUser?.id}">
			                        <g:message code="nimble.link.myaccount" />
			                     </g:link>
			                  </li>-->
							  <g:if test="${UserBase?.get(SecurityUtils.subject.principal)?.hasRole("Científico Ciudadano")}" >
			                    <g:render template="/_menu/navColaborator" />
			                  </g:if>
							  <g:if test="${UserBase?.get(SecurityUtils.subject.principal)?.hasRole("Investigador")}" >
			                    <g:render template="/_menu/navResearcher" />
			                  </g:if>
			                  <li>
			                     <g:link controller="auth" action="signout">
			                        <g:message code="bfcrowd.label.logout.navbar" />
			                     </g:link>
			                  </li>
			               </ul>
			            </li>
			         </ul>
			      </div>
			</g:if>	
			<g:else>	
				<ul class="nav pull-right" >	
					<li>
						<g:link controller="auth" action="login" style="color:#0088cc"><g:message code="bfcrowd.label.login.navbar" /></g:link>
					</li>		
				</ul>														
			</g:else>	
	</div>
</nav>