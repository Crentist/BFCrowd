package bfcrowd

import org.apache.shiro.subject.Subject

/**
 * ColaboratorController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class ColaboratorController {
	
	def index() {
		if ( getAuthenticatedUser() ) {
			
			//User u = User.findByUsername("admin")
	        //render "holasxs " + getAuthenticatedUser().myProjects
			[myProjects: getAuthenticatedUser().myProjects, layout_nosecondarymenu: true]
			//println "current user : $authenticatedUser"
		} else
			render "No hay usuario logueado"
    }
	
	def joinProject(String name) {
		if(name){
			Project p = Project.findByName(name)
			if(p){
				getAuthenticatedUser().myProjects.add(p)
			}
		}
		render template: "myProjects", model: [myProjects: getAuthenticatedUser().myProjects]
	}
	
	def project(int id) {
		if(id){
			Project p = Project.get(id)
			if(p){
				[project: p]
			} else
				render "error"
		}
	}
	
}
