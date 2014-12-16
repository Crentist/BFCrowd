package bfcrowd



import grails.test.mixin.*
import spock.lang.*

@TestFor(RecommendationController)
@Mock(Recommendation)
class RecommendationControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.recommendationInstanceList
            model.recommendationInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.recommendationInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def recommendation = new Recommendation()
            recommendation.validate()
            controller.save(recommendation)

        then:"The create view is rendered again with the correct model"
            model.recommendationInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            recommendation = new Recommendation(params)

            controller.save(recommendation)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/recommendation/show/1'
            controller.flash.message != null
            Recommendation.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def recommendation = new Recommendation(params)
            controller.show(recommendation)

        then:"A model is populated containing the domain instance"
            model.recommendationInstance == recommendation
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def recommendation = new Recommendation(params)
            controller.edit(recommendation)

        then:"A model is populated containing the domain instance"
            model.recommendationInstance == recommendation
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/recommendation/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def recommendation = new Recommendation()
            recommendation.validate()
            controller.update(recommendation)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.recommendationInstance == recommendation

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            recommendation = new Recommendation(params).save(flush: true)
            controller.update(recommendation)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/recommendation/show/$recommendation.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/recommendation/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def recommendation = new Recommendation(params).save(flush: true)

        then:"It exists"
            Recommendation.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(recommendation)

        then:"The instance is deleted"
            Recommendation.count() == 0
            response.redirectedUrl == '/recommendation/index'
            flash.message != null
    }
}
