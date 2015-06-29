import grails.plugin.nimble.InstanceGenerator
import grails.plugin.nimble.core.AdminsService
import grails.plugin.nimble.core.Role
import grails.plugin.nimble.core.RoleService
import grails.plugin.nimble.core.UserBase
import bfcrowd.Project
import bfcrowd.Recommendation
import bfcrowd.Contribution
import bfcrowd.User
import grails.plugins.rest.client.RestBuilder

class ZecBootStrap {
	
	def grailsApplication
	def userService
	def roleService

    def init = { servletContext ->
		def investigador
		def cciudadano
		if(!Role.findByName("Investigador")) {
			investigador = new Role(name: "Investigador", description: "Encargado de crear proyectos y asignarle tareas a los mismos", protect: false)
			investigador.save()
			cciudadano = new Role(name: "Científico Ciudadano", description: "Resuelve las tareas de los proyectos", protect: false)
			cciudadano.save()
		}
		else {
			investigador = Role.findByName("Investigador")
			cciudadano = Role.findByName("Científico Ciudadano")
		}
		
		User researcher
		
		if(!UserBase.findByUsername("ciudadano")) {
			def user = InstanceGenerator.user(grailsApplication)
			user.username = "ciudadano"
			user.pass = 'ciudadano'
			user.passConfirm = 'ciudadano'
			user.enabled = true

			def userProfile = InstanceGenerator.profile(grailsApplication)
			userProfile.fullName = "Maurice Moss"
			userProfile.owner = user
			user.profile = userProfile

			def savedUser = userService.createUser(user)
			if (savedUser.hasErrors()) {
				savedUser.errors.each { log.error(it) }
				throw new RuntimeException("Error creating user")
			}
			
			roleService.addMember(user, cciudadano)
		}				
		
		if(!UserBase.findByUsername("researcher")) {
			def user = InstanceGenerator.user(grailsApplication)
			user.username = "researcher"
			user.pass = 'researcher'
			user.passConfirm = 'researcher'
			user.enabled = true

			def userProfile = InstanceGenerator.profile(grailsApplication)
			userProfile.fullName = "Sherlock Holmes"
			userProfile.owner = user
			user.profile = userProfile

			def savedUser = userService.createUser(user)
			if (savedUser.hasErrors()) {
				savedUser.errors.each { log.error(it) }
				throw new RuntimeException("Error creating user")
			}
			
			roleService.addMember(user, investigador)
			researcher = user
		}
		else 
			researcher = User.findByUsername("researcher")
		
		if(!Project.findByName("Wikipedia tasks")) {
			Project project1 = new Project(name: "Wikipedia tasks", description: "Help us improve the contents on Wikipedia!", xpValue: 25, bonusXP: 25, requiredForBonus: 2)
			project1.addOwner(researcher)
			project1.save()
			Project project2 = new Project(name: "Spam filter", description: "SPAM SPAM SPAM LOVELY SPAM", xpValue: 15, bonusXP: 15, requiredForBonus: 3)
			project2.addOwner(researcher)
			project2.save()
			Project project3 = new Project(name: "Prank call", description: "Moe Szyslak is not amused", xpValue: 10, bonusXP: 10, requiredForBonus: 3)
			project3.addOwner(researcher)
			project3.save()
			Project project4 = new Project(name: "Drink supplier", description: "First aid on all things alcohol!", xpValue: 5, bonusXP: 5, requiredForBonus: 3)
			project4.addOwner(researcher)
			project4.save()
			def recomm1 = new Recommendation(property: "peopleFrom",
											path: "path",
											fromPage: "Rosario",
											toPage: "Lionel_Messi",
											solved: false,
											date: new Date(),
											instructions: "Agregar el articulo Lionel Messi (http://en.wikipedia.org/wiki/Lionel_Messi) a la categoría People From Rosario.",
											checkboxMode: "Checkbox")
			recomm1.project = project1
			recomm1.save()
			
			def recomm2 = new Recommendation(property: "peopleFrom",
											path: "path2",
											fromPage: "Paris",
											toPage: "Pierre_Curie",
											solved: false,
											date: new Date(),
											instructions: "Agregar el articulo Pierre Curie (http://en.wikipedia.org/wiki/Pierre_Curie) a la categoría People From Paris.",
											checkboxMode: "Checkbox")
			
			recomm2.project = project1
			recomm2.save()
			
			def recomm3 = new Recommendation(property: "peopleFrom",
											path: "path3",
											fromPage: "fromPage",
											toPage: "toPage",
											solved: false,
											date: new Date(),
											instructions: "Agregar el articulo Robin Moore (http://en.wikipedia.org/wiki/Robin_Moore) a la categoría People From Boston, Massachusetts.",
											checkboxMode: "Checkbox")
	
			recomm3.project = project1
			recomm3.save()
		}
		
		//Crear las badges por aquí
		/**def contenido = 
		[
			[
			id_app:  'bfcrowd_Wikipedia_tasks',
			name: 'BFCrowd Wikipedia Tasks',
			url:  'http://ciencia.lifia.info.unlp.edu.ar/bfcrowd',
			badges: (
					[
	            	name: "First contribution",
	            	imageUrl: "http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/11/1415490092badge.png",
	            	criteriaUrl: "http://ciencia.lifia.info.unlp.edu.ar/bfcrowd/badges",
	            	description: "My first contribution"
					] 
					)
				
			]
		]
				
		RestBuilder rest = new RestBuilder()
		
		//def resp = rest.get("http://ciencia.lifia.info.unlp.edu.ar/badges-api/")
		//println resp.json
		
		def resp = rest.post("http://ciencia.lifia.info.unlp.edu.ar/badges-api/carga-json") {
		 contentType "application/json"
			 json {
				 contenido
				 }
			 }
		 
		 println resp.json**/
    }
    def destroy = {
    }
}
