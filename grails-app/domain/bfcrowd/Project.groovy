package bfcrowd

import grails.plugins.rest.client.RestBuilder
/**
 * Project
 * A domain class describes the data object and its mapping to the database
 */
class Project {

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
	String name
	String description
	String type
	byte[] logo
	String logoType
	int xpValue //Amount of XP obtained by the user per recommendation solved (i.e Contribution) in the project
	//LinkedHashMap usersXP = [:]//Colección que asocie a los usuarios con su experiencia ganada (ID de usuario + xp)
	int bonusXP //Amount of XP obtained by the user when (s)he meets the required amount of recomendations solved (stored in 'requiredForBonus')
	int requiredForBonus
	
	/* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated
	static	belongsTo	= User
	static  mappedBy = [users: 'myProjects',	owners: 'ownedProjects']
	static	hasMany		= [recommendations:Recommendation, users:User, owners:User] //Debe conocer las contribuciones
//	static	belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
	static	hasOne		= [usersXP:LinkedHashMap] //Colección que asocia a los usuarios con su experiencia ganada (ID de usuario + xp)
 	 												// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
    static	mapping = {
		usersXP column: 'usersXP', sqlType: 'BLOB(100000)'
    }
    
	static	constraints = {
		name unique: true
		users nullable: true, blank: true
		recommendations nullable: true, blank: true
		usersXP nullable: true, blank: true
		logo(nullable:true, maxSize: 50000 /* 16K */)
		logoType(nullable:true)
		//type inList: ["imageProject", "taskProject"]
    }
	
	/*
	 * Methods of the Domain Class
	 */
	public String toString() {
		return "${name}";
	}
	
	public Recommendation getRecommendationFor(User u){
		if(this.recommendations) {
			def r = this.recommendations.find{ Recommendation w -> 
				w.canBeDeliveredFor(u) && !u.skippedRecom.contains(w)
				}
			if(r)
				r.setAssigned()
			return r
		}
		return null
	}
	
	public setUserXP(Long userID) {
		if (!usersXP) {
			this.usersXP = new LinkedHashMap()
			this.usersXP[(userID)]=0
			//println "gola"
		}
		else
			if (!(this.usersXP[userID])) {
				this.usersXP[(userID)]=0
				//println "gola2"
			}
			
		//println this.usersXP.class
	}
	
	public int getUserXPByID(Long id) {
		/*
		 * Método que dado un usuario retorne un entero que representa la experiencia obtenida del mismo
		 * en el proyecto
		 */
		this.usersXP[(id)]
	}
	
	public addOwner(User owner) {
		if (!owners){
			this.owners = new ArrayList()
		}
		this.owners.add(owner)
		owner.addProjectAsOwned(this)
	}

	public getUsersRanking() {
		this.usersXP.sort { -it.value }
		
	}

	/**def issueBadges() {
	
	//def resp = rest.get("https://cientificos-badges-api.herokuapp.com/")
	}
	
	def grantBadge(String userEmail, int idBadge) {
		
		RestBuilder rest = new RestBuilder()
		//def resp = rest.get("https://cientificos-badges-api.herokuapp.com/")
		//println resp.json
		
		def resp = rest.post("https://163.10.5.42/badges/90812gjd/instances") {
			contentType "application/json"
			json {
				email = "${userEmail}"
			}
		}
		
		println resp.json
	}
	
	def getUserBadges(User u) {
		//def badges = User.getEsos(u.id, this.name)
		User.holaMundo()
	
	}**/
		
}
