class HelloController < ApplicationController
  helper_method :message_helper

  def show
    @message = 'Hello'
  end

  private

  def message_helper
    'Hello from helper'
  end
end
