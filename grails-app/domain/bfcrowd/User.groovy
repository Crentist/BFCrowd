
package bfcrowd

class User extends grails.plugin.nimble.core.UserBase {

	// Extend UserBase with your custom values here
	String wikipediaUserID
	boolean requests //Indicates whether the user wants to be promoted to researcher

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
	
	/* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated
	
//	static	belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
	static	hasOne		= [profile:Profile]	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static	hasMany		= [myContributions:Contribution, myProjects:Project, skippedRecom:Recommendation]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping
	
	static	mapping = {
		
	}
	
	static	constraints = {
		wikipediaUserID nullable:true, blank: false
	}
	
	public String toString() {
		return username;
	}
	
	def next() {
		//Siguiente recomendación o contribución para completar
	}
	
	def hasRole(String role) {
		def roles = this.getRoles()
		for (r in roles) {
			if (r.name == role)
				return true
		}
		return false		
	}
	
	def rolesByName() {
		def roles = this.getRoles()
		def rolesNames = []
		for (r in roles) {
			rolesNames.add(r.name)
		}
		return rolesNames
	}
	
}