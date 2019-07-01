# frozen_string_literal: true

Rails.application.routes.draw do
  mount Homeland::Site::Engine => "/homeland-site"
end
