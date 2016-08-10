`import Ember from 'ember'`

ArticleEditRoute = Ember.Route.extend
  model: ->
    @modelFor 'article'

`export default ArticleEditRoute`
