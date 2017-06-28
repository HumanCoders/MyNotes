class WelcomeController < ApplicationController
  def hello
    @message = params[:message]
  end

  def goodbye
  end
end
