package bfcrowd

/**
 * Contribution
 * A domain class describes the data object and it's mapping to the database
 */
class Contribution {
	
	Date date

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
	
	/* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated
	
	static	belongsTo	= [user:User]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
	static	hasOne		= [recomendation:Recommendation]	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
    static	mapping = {
    }
    
	static	constraints = {
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
	
	def markAsSolved() {
		//this.recomendation.setAsSolved()
	}
	
	//En el caso en el que el usuario se encuentre con que el camino entre los pares ya está arreglado
	def alreadyDone() {
		
	}
	
}