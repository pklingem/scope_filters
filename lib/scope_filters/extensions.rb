module ScopeFilters
  module Extensions
    
    module ActiveRecord
      def self.included(base)
        base.class_eval do
          def self.apply_scopes(scopes_hash)
            scoped_relation = select('*')
            return scoped_relation if scopes_hash.nil?
            scopes_array = scopes_hash.keys.collect {|scope| scope.to_sym}
            (scopes_array & scopes.keys).each do |scope|
              scoped_relation = scoped_relation.send(scope)
            end
            return scoped_relation
          end
        end
      end
    end

    module ApplicationHelper
      def self.included(base)
        base.class_eval do
          def filter_links(model = nil, additional_params = {})
            case model
            when nil
              model_name = @controller.controller_name.titleize
            when String, Symbol, Class
              model_name = model.to_s
            else
              raise ArgumentError, "incorrect model object"
            end
            render 'filter_links', :model_class => model_name.constantize, :additional_params => additional_params
          end
          
          def applied_scopes_hash
            params[:scopes].nil? ? {} : params[:scopes].reject {|key, value| false}
          end

          def applied_scopes
            applied_scopes_hash.keys
          end
          
          def params_for_remove_scope_path(scope_name)
            params_with_removed_scope = {}
            params_with_removed_scope[:scopes] = applied_scopes_hash.reject {|key, value| key == scope_name} unless applied_scopes_hash.empty?
            params_with_removed_scope.delete(:scopes) if params_with_removed_scope[:scopes].empty?
            return params_with_removed_scope
          end

          def remove_scope_path(scope_name, additional_params = {})
            request_parameters = params_for_remove_scope_path(scope_name).merge(additional_params)
            "#{request.path}#{request_parameters.empty? ? '' : '?'}#{request_parameters.to_query}"
          end
          
          def apply_scope_path(scope_name, additional_params = {})
            request_parameters = { :scopes => applied_scopes_hash.merge({scope_name => nil}) }.merge(additional_params)
            "#{request.path}?#{request_parameters.to_query}"
          end
        end
      end
    end

  end
end
