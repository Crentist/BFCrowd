package bfcrowd

/**
 * UserBFController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class UserBFController {

	//static scaffold = true
//	def index = { }
	
	def requestPromotion(Long id) {
		User user = User.get(id)
		user.setRequests(true)
		//redirect(uri: '/')
		render(view: 'requestedpromotion')
	}
}
