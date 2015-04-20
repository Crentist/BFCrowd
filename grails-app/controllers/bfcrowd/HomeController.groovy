package bfcrowd

/**
 * HomeController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class HomeController {

	//static scaffold = true
	def index(){
		/**
		 * Ver si acá puedo mostrar la vista que corresponda de acuerdo al rol del usuario
		 * logueado (o si no hay nadie logueado)
		 */
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
			else render view: "index"
	}
	
	def joinProjectById(int id) {
		Project p = Project.get(id)
		if(p){
			getAuthenticatedUser().myProjects.add(p)
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
