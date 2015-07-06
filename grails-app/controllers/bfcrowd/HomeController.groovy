package bfcrowd

import groovy.json.JsonBuilder
import grails.converters.JSON
import grails.plugins.rest.client.RestBuilder
import groovy.json.JsonOutput
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
		
		def contenido =
		 //[
			[
			    id_app: 'bfcrowd_Wikipedia_tasks',
			    name: 'BFCrowd Wikipedia Tasks',
			    url: 'http://ciencia.lifia.info.unlp.edu.ar/bfcrowd',
			    badges : [
			     [ name: "First contribution", imageUrl: "http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/11/1415490092badge.png", criteriaUrl: "http://ciencia.lifia.info.unlp.edu.ar/bfcrowd/badges", description: "My first contribution"]
			     ]
			  
			]
		//]
			
		JsonBuilder js2 = new JsonBuilder(contenido);
		//println js2.toPrettyString()
		
		def jsond = new JsonBuilder()
		jsond
		[
		{
			id_app  'bfcrowd_Wikipedia_tasks'
			name 'BFCrowd Wikipedia Tasks'
			url  'http://ciencia.lifia.info.unlp.edu.ar/bfcrowd'
			badges {
					name "First contribution"
					imageUrl "http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/11/1415490092badge.png"
					criteriaUrl "http://ciencia.lifia.info.unlp.edu.ar/bfcrowd/badges"
					description "My first contribution"	
			}	
			
		}
		]
		
		//println json.toPrettyString()
		
		//def lalala = [id_app: 'bfcrowd_Wikipedia_tasks', name: 'BFCrowd Wikipedia Tasks', url:  'http://ciencia.lifia.info.unlp.edu.ar/bfcrowd']	
		
		//def lolao = [{"id_app":"galaxy_conqueror", name:'Galaxy Conqueror', url:'http://example.com', badges:[{"name":"Cat Lover","imageUrl":"http://example.com/cat.png","criteriaUrl":"http://example.com/catBadge.html","description":"You love cats!"}]}]
		
		//def loalalso = {    "state": {        "name": "Colorado",        "statehood": 1876,        "capital": "Denver",        "majorCities": [            "Denver",            "Colorado Springs",            "Fort Collins",            "Boulder",            "Grand Junction"        ]    }}
		//println contenido
		
		
		RestBuilder rest = new RestBuilder()
		
		//def resp = rest.get("http://ciencia.lifia.info.unlp.edu.ar/badges-api/")
		//println resp.json
		
		/**def resp = rest.post("http://ciencia.lifia.info.unlp.edu.ar/badges-api/carga-json") {
			 contentType "text/html"
			 json {
				 '''[
					{
					    "id_app": "bfcrowd_Wikipedia_tasks",
					    "name": "BFCrowd Wikipedia Tasks",
					    "url": "http://ciencia.lifia.info.unlp.edu.ar/bfcrowd",
					    "badges": [
					        {
					            "name": "First contribution",
					            "imageUrl": "http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/11/1415490092badge.png",
					            "criteriaUrl": "http://ciencia.lifia.info.unlp.edu.ar/bfcrowd/badges",
					            "description": "My first contribution"
					        }
					    ]
					}
				 	]
				 '''
			 }
			 
		}
		 
		 println resp.json**/

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
	
	def badges() {
		render view: "badges"
	}
	
}
