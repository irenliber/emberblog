`import Ember from 'ember'`

ArticleRoute = Ember.Route.extend
  model: ->
    @modelFor 'article'

`export default ArticleRoute`
