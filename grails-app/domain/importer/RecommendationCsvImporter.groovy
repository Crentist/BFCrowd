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
		Recommendation recomm
		String rows = new File('web-app/last_import.csv').getText('UTF-8')
		def regExp = splitChar+'(?=([^\"]*\"[^\"]*\")*[^\"]*$)'
		def obtainedErrors = []
		def lines = rows.split('\n')
		def i = 0
		def splittedLines = lines*.split(regExp)
		
		if ( splittedLines.count { line -> line.size() != 7 } > 0 ) {
			obtainedErrors.add(["Structure Problem: there is some line that not has 7 fields"])
		} else {				
			splittedLines.each { cells -> 
				cells = cells.collect {
					if (it.getAt(0) == '"' && it.getAt(it.size()-1) == '"') {
						it = it.substring(1, it.size() - 1)
					}
					it
				}
				def project = Project.findByName(cells[0])
				def params = [
					project:project,
					property:cells[1],
					path:cells[2],
					fromPage:cells[3],
					toPage:cells[4],
					instructions:cells[5],
					checkboxMode:cells[6]
					]
				recomm = new Recommendation(params)
				
				if (!recomm.save(flush:true))
					obtainedErrors.add(recomm.errors.allErrors)
				else
					i++
			}
		}
		
		return [passed: i, errors: obtainedErrors]
	}
	
	def importFile() {
		this.importFile(';')
	}
	
}
