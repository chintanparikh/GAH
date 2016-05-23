App.game = App.cable.subscriptions.create "GameChannel",
  received: (data) ->
    console.log(data)

  send_gif: (msg) ->
    @perform 'send_gif', gif: gif