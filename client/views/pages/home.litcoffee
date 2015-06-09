    Template.home.helpers
      response: -> (Session.get 'response')?.response

    Template.home.events
      'submit form': (event) ->
        event.preventDefault()

        $('.question-form')[0].reset()

        Meteor.call 'randomResponse', (error, response) ->
          console.log response
          Session.set 'response', response
