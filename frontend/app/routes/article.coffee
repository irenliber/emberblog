`import Ember from 'ember'`

ArticleShowRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'article', params.id

`export default ArticleShowRoute`
