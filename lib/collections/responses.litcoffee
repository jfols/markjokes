# Responses collection

    @Responses = new Mongo.Collection 'responses'

    Responses.allow
      insert: (userId, doc) -> userId?
      update: (userId, doc, fieldNames, modifier) -> userId?
      remove: (userId, doc) -> userId?

    Meteor.methods
      randomResponse: ->
        return if this.isSimulation
        projection =
          sort:
            count: 1
          limit: 1
        response = (Responses.find {}, projection).fetch()[0]

        criteria =
          _id: response._id
        action =
          $inc:
            count: 1
        Responses.update criteria, action

        console.log response
        return response
