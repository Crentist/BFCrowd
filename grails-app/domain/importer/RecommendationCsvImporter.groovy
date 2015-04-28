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
		//println(rows)
		def lines = rows.split('\n')
//		def x = lines*.split(';')
		
		def x = lines*.split(';(?=([^\"]*\"[^\"]*\")*[^\"]*$)')
		//println x
//		println "valores en 0: "+x*.getAt(0)
		lines.each { line -> 
			//def cells = line.split(';')
			def cells = line.split(';(?=([^\"]*\"[^\"]*\")*[^\"]*$)')
			println(cells)
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
				recomm.save(flush:true)
			} else {
			// TODO EL project no existe
			}
		}
	}
	
}
