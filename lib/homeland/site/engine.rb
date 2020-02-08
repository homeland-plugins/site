# frozen_string_literal: true

module Homeland::Site
  class Engine < ::Rails::Engine
    isolate_namespace Homeland::Site

    initializer "homeland.site.migrate" do |app|
      app.config.paths["db/migrate"].concat(config.paths["db/migrate"].expanded)
      # Execute Migrations on engine load.
      ActiveRecord::Tasks::DatabaseTasks.migrate
    end

    initializer "homeland.site.init" do |app|
      app.routes.prepend do
        mount Homeland::Site::Engine => "/"
      end
    end
  end
end
