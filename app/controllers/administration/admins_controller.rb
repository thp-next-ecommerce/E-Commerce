# frozen_string_literal: true

module Administration
  class AdminsController < AdministrationController
    def index
      @admins = Admin.all
    end
  end
end
