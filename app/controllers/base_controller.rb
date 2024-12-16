# frozen_string_literal: true

class BaseController < ApplicationController
  before_action :user_signed_in?

  private

  def user_signed_in?
    redirect_to root_path unless current_user
  end
end
