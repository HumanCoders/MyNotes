class WelcomeController < ApplicationController
  def hello
    @message = params[:message]
  end
end
