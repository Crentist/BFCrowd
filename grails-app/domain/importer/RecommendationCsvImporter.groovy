package importer

import bfcrowd.*

/**
 * RecommendationCsvImporter
 * A domain class describes the data object and it's mapping to the database
 */
class RecommendationCsvImporter {

    static	mapping = {
    }
    
	static	constraints = {
    }
	
	def importFile(String splitChar) {
		String rows = new File('web-app/last_import.csv').getText('UTF-8')
		def regExp = splitChar+'(?=([^\"]*\"[^\"]*\")*[^\"]*$)';
		//String rows = file.getText('UTF-8')
		//println(rows)
		def lines = rows.split('\n')
		
		def splittedLines = lines*.split(regExp)
		def projectNames = splittedLines*.getAt(0)
		def checkboxModes = splittedLines*.getAt(6)
	
//		if (!Recommendation.constraints.checkboxMode.getAppliedConstraint('inList').(checkboxModes)){
//			println "un checkbox falla"
//		}
		if (!projectNames.contains('')) {
			def projects = []
			projectNames.each { p ->
				projects.add(Project.findByName(p))
			}
			if (!projects.contains(null)) {
				splittedLines.each { cells -> 
					def project = Project.findByName(cells[0])
					if (project) {
						def params = [
							project:project.id,
							property:cells[1],
							path:cells[2],
							fromPage:cells[3],
							toPage:cells[4],
							instructions:cells[5],
							checkboxMode:cells[6]
							]
						Recommendation recomm = new Recommendation(params)
						if (recomm.validate()) {
							recomm.save(flush:true)
						} else {
							recomm.errors.allErrors.each {
								println it
							}
						}
					} else {
					
					}
				}
			} else {
				// TODO hay project inexistente
				println "Project inexistente"
				return new Error("Some project name does not exists.")
			}
		} else {
			// TODO El project es vacio
			println "Project vacio"
			return new Error("Field 'project' is empty on some file line.")
		}
		
	}
	
	def importFile() {
		this.importFile(';')
	}
	
}
