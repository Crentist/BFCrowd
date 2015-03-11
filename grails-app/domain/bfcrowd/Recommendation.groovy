package bfcrowd

/**
 * Recommendation
 * A domain class describes the data object and it's mapping to the database
 */
	


class Recommendation {
	
	/*
	 * 
	 * Path: #from / * / Cat:ALGO_#from / #to
	 * Página From: París
	 * Página To: Ir a la página y agregar el link [[Categoría:ALGO_París]]
	 * 
	 */
	
	String property //Obtenida del escenario
	String path  //Featured Path Query a utilizar
	String fromPage 
	String toPage
	Boolean solved
	Date dateAssigned = new Date(0) // Fecha en que se asignó la recomendación a un colaborador, para que no sea vuelta a asignar instantaneamente

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
	String instructions
	String checkboxMode
	
	/* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated
	
	static 	belongsTo 	= [project:Project]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
	static	hasOne		= [contribution:Contribution]	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static	hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
	
    static	mapping = {
    }
    
	static	constraints = {
		checkboxMode inList: ["Checkbox", "Radio"]
		contribution nullable: true
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
	
	Boolean isSolved(){
		this.solved
	}
	
	def setAssigned(){
		this.dateAssigned = new Date()
	}
	
	Boolean setAsSolved() {
		this.solved = true;
		this.date = new Date()
		
	}
	
	//Puede volverse al estado unsolved si por ejemplo cambia algo en alguna convención de Wikipedia
	Boolean setAsUnsolved() {
		this.solved = false;
		this.date = new Date()
	}
	
	//Un pequeño script que indica paso a paso cómo insertar correctamente el link que conecta al par
	def getSolutionScript() {
		//TO-DO
	}
	
}