require 'rails_admin/config/actions'
require 'rails_admin/config/actions/bulk_delete'


# Mostly the same as rails_admin/config/actions/bulk_delete.rb
# with a small change in the logic checking whether or not the objects were destroyed
module RailsAdmin
  module Config
    module Actions
      class BulkParanoiaDelete < BulkDelete
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :controller do
          proc do
            if request.post? # BULK DELETE
              @objects = list_entries(@model_config, :destroy)

              if @objects.blank?
                flash[:error] = t('admin.flash.error', name: pluralize(0, @model_config.label), action: t('admin.actions.bulk_paranoia_delete.done'))
                redirect_to index_path
              else
                render @action.template_name
              end

            elsif request.delete? # BULK DESTROY

              destroyed = nil
              not_destroyed = nil

              unless params[:bulk_ids].blank?
                @objects = list_entries(@model_config, :destroy)
                unless @objects.blank?
                  processed_objects = @abstract_model.destroy(@objects)

                  # Check if model is acting as paranoid to use correct method in checking if objects were destroyed
                  is_destroyed_method = @abstract_model.model.method_defined?(:paranoia_destroyed?) ? :paranoia_destroyed? : :destroyed?

                  destroyed = processed_objects.select(&is_destroyed_method)
                  not_destroyed = processed_objects - destroyed
                  destroyed.each do |object|
                    @auditing_adapter && @auditing_adapter.delete_object(object, @abstract_model, _current_user)
                  end
                end
              end

              if destroyed.nil?
                flash[:error] = t('admin.flash.error', name: pluralize(0, @model_config.label), action: t('admin.actions.bulk_paranoia_delete.done'))
              else
                flash[:success] = t('admin.flash.successful', name: pluralize(destroyed.count, @model_config.label), action: t('admin.actions.bulk_paranoia_delete.done')) unless destroyed.empty?
                flash[:error] = t('admin.flash.error', name: pluralize(not_destroyed.count, @model_config.label), action: t('admin.actions.bulk_paranoia_delete.done')) unless not_destroyed.empty?
              end
              redirect_to back_or_index
            end
          end
        end
      end
    end
  end
end

