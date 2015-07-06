package bfcrowd

import grails.transaction.Transactional;
import java.text.SimpleDateFormat
import grails.plugins.rest.client.RestBuilder

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
				def user = getAuthenticatedUser()
				user.myProjects.add(p)
				p.usersXP[user.id]=0 //Initialize xp value on that project
				assert p.usersXP.get(user.id) == 0
			}
		}
		render template: "myProjects", model: [myProjects: getAuthenticatedUser().myProjects]
	}
	
	def joinProjectById(int id) {
		Project p = Project.get(id)
		if(p){
			def user = getAuthenticatedUser()
			user.myProjects.add(p)
			println p.name
			p.usersXP[user.id]=0 //Initialize xp value on that project
			assert p.usersXP.get(user.id) == 0
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
		Contribution c = new Contribution([text: text, state: state, recomendation: r, user: u, solvedDate: new Date()])
		c.save(flush: true)
		println c
		Project p = Project.get(r.project.id)
		def obtainedXP = p.xpValue + this.checkBonus(p, u)
		p.usersXP[u.id] += obtainedXP
		u.myXP += obtainedXP
		//this.checkBadges()
		
		
		def recom = p.getRecommendationFor(getAuthenticatedUser())
		render view: "project", model: [project: p, recommendation: recom, layout_nosecondarymenu: true]
	}
	
	def checkBonus(Project p, User u) {
		
		def sdf = new SimpleDateFormat("dd/MM/yyyy")
		def today = new Date()
		
		//Acá tiene que ser las contrib de ese proyecto, no todas
		if (u.getMyContributions().count {it.getRecomendation().getProject() == p && sdf.format(it.solvedDate) == sdf.format(today) } == p.getRequiredForBonus()) {
		//if (u.getMyContributions().count { sdf.format(it.solvedDate) == sdf.format(today) } == p.getRequiredForBonus()) {
			return p.bonusXP
			}
			else return 0
		
	}
	
}
