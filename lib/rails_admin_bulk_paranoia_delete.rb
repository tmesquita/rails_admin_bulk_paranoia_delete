require "rails_admin_bulk_paranoia_delete/engine"

module RailsAdminBulkParanoiaDelete
end

require 'rails_admin/config/actions'

module RailsAdmin
  module Config
    module Actions
      class BulkParanoiaDelete < Base
        RailsAdmin::Config::Actions.register(self)
        
        register_instance_option :object_level do
          true
        end
      end
    end
  end
end

