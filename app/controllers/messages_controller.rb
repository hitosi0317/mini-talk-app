class MessagesController < ApplicationController
  def new
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message =Message.new(text: params[:message][:text])
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end
end


#追記した10行目は、broadcastを通して、'message_channel'に向けて@messageを送信するということです。

