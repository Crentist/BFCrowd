package bfcrowd


/**
 * Project
 * A domain class describes the data object and it's mapping to the database
 */
class Project {

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
	String name
	String description
	int xpValue //Amount of XP obtained by the user per recommendation solved (i.e Contribution) within the project
	//LinkedHashMap usersXP = [:]//Colección que asocie a los usuarios con su experiencia ganada (ID de usuario + xp)
	
	/* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated
	static	belongsTo	= User 
	static	hasMany		= [recommendations:Recommendation, users:User] //Debe conocer las contribuciones
//	static	belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
	static	hasOne		= [usersXP:LinkedHashMap]	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
    static	mapping = {
		usersXP column: 'usersXP', sqlType: 'VARBINARY(10000)'
    }
    
	static	constraints = {
		name unique: true
		usersXP blank: true
    }
	
	/*
	 * Methods of the Domain Class
	 */
	public String toString() {
		return "${name}";
	}
	
	public Recommendation getRecommendationFor(User u){
		if(this.recommendations) {
			def d = new Date()
			def r = this.recommendations.find{ Recommendation w -> 
				w.dateAssigned.time < (d.time - 3600) && 
				!w.contribution &&
				!u.skippedRecom.contains(w)
				}
			if(r)
				r.setAssigned()
			return r
		}
		return null
	}
	
	public setUserXP(Long userID, int xpValue) {
		this.usersXP = new LinkedHashMap()
		this.usersXP[(userID)]=xpValue
		println this.usersXP.class
	}
	
	public int getUserXPByID(Long id) {
		this.usersXP[(id)]
	}
	
	/*
	 * Método que dado un usuario retorne un entero que representa la experiencia obtenida del mismo
	 * en el proyecto
	 */
}
