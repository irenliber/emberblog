`import Ember from 'ember'`

ArticleEditController = Ember.Controller.extend
  actions:
    delete: ->
      @get('model').destroyRecord().then => @transitionToRoute 'articles.index'

`export default ArticleEditController`
