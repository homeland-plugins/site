# frozen_string_literal: true

module Homeland::Site
  class Engine < ::Rails::Engine
    isolate_namespace Homeland::Site

    initializer "homeland.site.migrate" do |app|
      migrate_paths = [File.expand_path("../../../migrate", __dir__)]

      # Execute Migrations on engine load.
      ActiveRecord::Migrator.migrations_paths += migrate_paths
      begin
        ActiveRecord::Tasks::DatabaseTasks.migrate
      rescue ActiveRecord::NoDatabaseError
      end
    end

    initializer "homeland.site.init" do |app|
      app.routes.prepend do
        mount Homeland::Site::Engine => "/"
      end
    end
  end
end
