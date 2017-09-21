require 'rails/generators/active_record'

module RailsTimeseries
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      desc 'install RailsTimeseries templates'
      argument :name, type: :string, default: ""
      source_root File.expand_path('../templates', __FILE__)

      def copy_templates
        migration_template 'create_timeseries.rb', 'db/migrate/create_timeseries.rb'
        template 'timeseries.rb', 'app/models/timeseries.rb'
        template 'schedule.rb', 'config/schedule.rb'
      end
    end
  end
end
