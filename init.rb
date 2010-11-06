require 'redmine'

require 'dispatcher'

Dispatcher.to_prepare :redmine_absolute_dates do
  require_dependency 'application_helper'
  ApplicationHelper.send(:include, AbsoluteDateHelperPatch) 
end


Redmine::Plugin.register :redmine_absolute_dates do
  name 'Redmine Absolute Dates plugin'
  author 'suer'
  description 'Display absolute create or update dates '
  version '0.0.1'
  url 'http://d.hatena.ne.jp/suer'
  author_url 'http://d.hatena.ne.jp/suer'
end
