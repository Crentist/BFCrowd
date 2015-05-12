package importer

import bfcrowd.Recommendation

import org.apache.shiro.subject.Subject
/**
 * RecommendationCsvImporterController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class RecommendationCsvImporterController {

	def index() {
		[layout_nosecondarymenu: true]
    }
	
	def importFile() {
	    def f = request.getFile('filecsv')
	    if (f.empty) {
	        flash.message = 'file cannot be empty'
	        render(view: 'uploadForm')
	        return
	    }
		//validate file or do something crazy hehehe
		
		//now transfer file
		def webrootDir = servletContext.getRealPath("/") //app directory
		println webrootDir 
		File fileDest = new File(webrootDir,"last_import.csv")
		f.transferTo(fileDest)
		RecommendationCsvImporter importer = new RecommendationCsvImporter()
		importer.importFile()
		[layout_nosecondarymenu: true]
	}
}
