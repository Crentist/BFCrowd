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
			// Create example User account
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
			// Create example User account
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
	
		def project = new Project(name: "peopleFrom")
		project.save()
		def recomm1 = new Recommendation(property: "peopleFrom",
										path: "path",
										fromPage: "fromPage",
										toPage: "toPage",
										solved: false,
										date: new Date(),
										instructions: "Click por ahi y otro por allá",
										checkboxMode: "Checkbox")
		recomm1.project = project
		recomm1.save()
		
		def recomm2 = new Recommendation(property: "peopleFrom",
										path: "path2",
										fromPage: "fromPage",
										toPage: "toPage",
										solved: false,
										date: new Date(),
										instructions: "Click por ahi y otro por allá",
										checkboxMode: "Checkbox")
		
		recomm2.project = project
		recomm2.save()
		
		def recomm3 = new Recommendation(property: "peopleFrom",
										path: "path3",
										fromPage: "fromPage",
										toPage: "toPage",
										solved: false,
										date: new Date(),
										instructions: "Click por ahi y otro por allá",
										checkboxMode: "Checkbox")

		recomm3.project = project
		recomm3.save()
		//recomm1.contribution =
		//Crear proyectos y recomendaciones acá
    }
    def destroy = {
    }
}
