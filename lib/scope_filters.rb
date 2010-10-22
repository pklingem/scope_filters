require "active_record" 
require "scope_filters/extensions" 

ActiveRecord::Base.class_eval { include ScopeFilters::Extensions::ActiveRecord }
ApplicationHelper.class_eval  { include ScopeFilters::Extensions::ApplicationHelper }
