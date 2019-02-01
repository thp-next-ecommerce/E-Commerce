# frozen_string_literal: true

class AdministrationController < ApplicationController
  before_action :authenticate_admin!
  layout "administration"

  protected

  def after_sign_in_path_for(_admins)
    administration_admin_path
  end
end
