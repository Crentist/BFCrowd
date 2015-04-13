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
	
	
	def importFile(){
		String rows = new File("web-app/last_import.csv").getText('UTF-8')
		//String rows = file.getText('UTF-8')
		rows.eachLine { line -> 
			def cells = line.split(',')
			def project = Project.findByName(cells[0])
			if (!project) {
				project = new Project( name:cells[0] )
				project.save()
			}
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
				recomm.save()
			}
		}
	}
	
}
