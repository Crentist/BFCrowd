package bfcrowd

/**
 * UserController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class UserController {

	static scaffold = true
//	def index = { }
	
	def createUser() {
		if (!nimbleConfig.localusers.registration.enabled) {
			log.warn("Account registration is not enabled for local users, skipping request")
			response.sendError(404)
			return
		}

		def user = InstanceGenerator.user(grailsApplication)
		user.profile = InstanceGenerator.profile(grailsApplication)

		log.debug("Starting new user creation")
		//render template:"createuser", model:[user: user]
		println "createUser de mi User"
		render "createUser de mi User"
		
		
	}
}
