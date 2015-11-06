package bfcrowd

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(InstructionsForm)
class InstructionsFormSpec extends Specification {
	InstructionsForm inst
    def setup() {
    }

    def cleanup() {
    }

    void "test default instance creation"() {
		given: "a single default InstructionsForm instantiation"
		inst = new InstructionsForm()
		
		expect:
		inst.getContributions() == null

		//assertFalse(task.hasContribution())
		//assertFalse(task.hasProject())
		
    }
}
