require "active_record" 
require "scope_filters/extensions" 

ActiveRecord::Base.class_eval { include ScopeFilters::Extensions::ActiveRecord }
ActionView::Base.send :include, ScopeFilters::Extensions::ScopeFiltersHelper 
