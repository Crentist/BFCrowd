import grails.plugin.nimble.InstanceGenerator
import grails.plugin.nimble.core.AdminsService
import grails.plugin.nimble.core.Role
import grails.plugin.nimble.core.RoleService
import grails.plugin.nimble.core.UserBase
import bfcrowd.Project
import bfcrowd.Recommendation
import bfcrowd.Contribution

class BootStrap {
	
	def grailsApplication
	def userService
	def roleService

    def init = { servletContext ->
		def investigador = new Role(name: "Investigador", description: "Encargado de crear proyectos y asignarle tareas a los mismos", protect: false)
		investigador.save()
		def cciudadano = new Role(name: "Científico Ciudadano", description: "Resuelve las tareas de los proyectos", protect: false)
		cciudadano.save()
		
		if(!UserBase.findByUsername("cCiudadano")) {
			def user = InstanceGenerator.user(grailsApplication)
			user.username = "cCiudadano"
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
		}
		
		def project1 = new Project(name: "Wikipedia tasks")
		project1.save()
		def project2 = new Project(name: "Spam filter")
		project2.save()
		def project3 = new Project(name: "Prank call")
		project3.save()
		def project4 = new Project(name: "Drink supplier")
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
    def destroy = {
    }
}
