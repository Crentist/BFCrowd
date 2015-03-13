package bfcrowd

import grails.transaction.Transactional;

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
			[myProjects: getAuthenticatedUser().myProjects, otherProjects: Project.getAll() - getAuthenticatedUser().myProjects, layout_nosecondarymenu: true]
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
	
	def joinProjectById(int id) {
		Project p = Project.get(id)
		if(p){
			getAuthenticatedUser().myProjects.add(p)
		}
		render template: "myProjects", model: [myProjects: getAuthenticatedUser().myProjects, otherProjects: Project.getAll() - getAuthenticatedUser().myProjects]
	}
	
	def leaveProjectById(int id) {
		Project p = Project.get(id)
		if(p){
			getAuthenticatedUser().myProjects.remove(p)
		}
		render template: "myProjects", model: [myProjects: getAuthenticatedUser().myProjects, otherProjects: Project.getAll() - getAuthenticatedUser().myProjects]
	}
	
	def otherProjects() {
		if ( getAuthenticatedUser() ) {
			[otherProjects: Project.getAll() - getAuthenticatedUser().myProjects]
		}
	}
	
	
	def project(int id) {
		if(id){
			Project p = Project.get(id)
			if(p){
				def r = p.getRecommendationFor(getAuthenticatedUser())
				[project: p, recommendation: r, layout_nosecondarymenu: true]
			} else
				render "error"
		}
	}
	
	def skip(int recommendationId) {
		def r = Recommendation.get(recommendationId)
		def u = getAuthenticatedUser()
		r.dateAssigned = new Date(0)
		u.skippedRecom.add(r)
		Project p = Project.get(r.project.id)
		def recom = p.getRecommendationFor(getAuthenticatedUser())
		render view: "project", model: [project: p, recommendation: recom, layout_nosecondarymenu: true]
	}
	
	def saveContribution(int recommendationId, String state, String text) {
		// Acá deberían ser solo Recommendations a las que el User pueda contribuir
		def r = Recommendation.get(recommendationId)
		def u = getAuthenticatedUser()
		Contribution c = new Contribution([text: text, state: state, recomendation: r, user: u])
		c.save(flush: true)
		println c
		Project p = Project.get(r.project.id)
		def recom = p.getRecommendationFor(getAuthenticatedUser())
		render view: "project", model: [project: p, recommendation: recom, layout_nosecondarymenu: true]
	}
}
