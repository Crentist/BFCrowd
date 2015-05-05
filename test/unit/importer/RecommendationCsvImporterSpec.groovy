package importer

import grails.test.mixin.TestFor
//import grails.test.mixin.Mock
//import grails.test.mixin.DomainClass
//import grails.test.mixin.domain.DomainClassUnitTestMixin
import spock.lang.Specification
import bfcrowd.*


/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(RecommendationCsvImporter)
class RecommendationCsvImporterSpec extends Specification {

    def setup() {
		def project1 = new Project(name: "Project1", description: "Help us improve the contents on Wikipedia!", xpValue: 25)
		def project2 = new Project(name: "Project2", description: "Help us improve the contents on Wikipedia!", xpValue: 25)
		def project3 = new Project(name: "Project3", description: "Help us improve the contents on Wikipedia!", xpValue: 25)
//		project1.save()
		mockDomain(Project, [project1,project2,project3])
		mockDomain(Recommendation)
    }

    def cleanup() {
    }

    void "test importFile with a normal file"() {
		when:
		def importer = new RecommendationCsvImporter()
		BufferedWriter writer = null;
		try {
			//create a temporary file
			File logFile = new File("web-app/last_import.csv");
			
			writer = new BufferedWriter(new FileWriter(logFile));
			writer.write('''Project1;property;path;fromPage;toPage;Instrucctions;Checkbox
Project1;fff;asdf;fdsa;fdf;fff;Checkbox
Project1;fff2;asdf2 fds fdsf;fdsa2;fdf2;fff2;Checkbox
Project1;fff2;asdf2 fds fdsf;fdsa2;fdf2;fff2;Checkbox
Project2;LLLL;LLLL;LLLL;LLLL;LLLL;Checkbox
Project2;A1;A1;A1;A1;A1;Checkbox
Project2;fff2;asdf2 fds fdsf;fdsa2;fdf2;fff2;Checkbox
Project3;CCC;CCC;CCC;CCC;CCC;Checkbox
Project3;GGGG;GGGG;GGGG;GGGG;GGGG;Checkbox''');
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// Close the writer regardless of what happens...
				writer.close();
			} catch (Exception e) {
			}
		}
		importer.importFile()
		
		then:
//		println Project.getAll()
		Project.findByName("Project1").recommendations.size() == 4
		Project.findByName("Project2").recommendations.size() == 3
		Project.findByName("Project3").recommendations.size() == 2
    }
}
