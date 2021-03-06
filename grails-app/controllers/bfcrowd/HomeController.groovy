package bfcrowd

/**
 * HomeController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class HomeController {

	//static scaffold = true
	def index() {
		//println getAuthenticatedUser()?.getRoles()*.getName();
		/**
		 * Cambiar lo siguiente por una cláusula Switch si es posible
		 * http://mrhaki.blogspot.com.ar/2009/08/groovy-goodness-switch-statement.html
		 */
		if (getAuthenticatedUser()?.hasRole("Científico Ciudadano")) {
			render view: "collabIndex"
		}
		else
			if (getAuthenticatedUser()?.hasRole("Investigador")) {
				render view: "researcherIndex"
			}
			else 
				if (getAuthenticatedUser()?.hasRole("SYSTEM ADMINISTRATOR"))
					render view: "adminIndex"
				else				
					render view: "index"
	}
	
	def joinProjectById(int id) {
		Project p = Project.get(id)
		if(p){
			def user = getAuthenticatedUser()
			user.myProjects.add(p)
			p.setUserXP(user.id, 0)
			assert p.usersXP.get((user.id)) == 0
		}
		render template: "myProjects"
	}

	def leaveProjectById(int id) {
		Project p = Project.get(id)
		if(p){
			getAuthenticatedUser().myProjects.remove(p)
		}
		render template: "myProjects"
	}
	
}
