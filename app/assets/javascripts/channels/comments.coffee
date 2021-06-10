App.comments = App.cable.subscriptions.create "CommentsChannel",
  collection: -> $('#comments')

  connected: ->
    setTimeout =>
      @followCurrentArticle()
    , 1000

  disconnected: ->

  followCurrentArticle: ->
    productId = @collection().data('product-id')
    if productId
      @perform 'follow', product_id: productId
    else
      @perform 'unfollow'

  received: (data) ->
    @collection().append(data['comment'])
