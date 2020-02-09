# frozen_string_literal: true

module Homeland::Site
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
    layout "homeland/site/application"

    def current_ability
      @current_ability ||= Homeland::Site::Ability.new(current_user)
    end
  end
end
