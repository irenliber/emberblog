`import Ember from 'ember'`

ArticleEditController = Ember.Controller.extend
  actions:
    save: ->
      @get('model').save().then => @transitionToRoute 'articles.index'
`export default ArticleEditController`
