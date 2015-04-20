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
