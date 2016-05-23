# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GameChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'game'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_gif
    ActionCable.server.broadcast('gifs',
          gif: render_gif(data['gif']))
  end

  private

  def render_gif(gif)
    ApplicationController.render(partial: 'gifs/gif',
                                 locals: { gif: gif })
  end
end
