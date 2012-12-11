require 'redmine'

#require 'dispatcher'

Rails.configuration.to_prepare do
  require_dependency 'application_helper'
  ApplicationHelper.send(:include, AbsoluteDateHelperPatch)
end

Rails.application.config.i18n.load_path += Dir["#{File.dirname(__FILE__)}/config/locales/*.{rb,yml}"]

Redmine::Plugin.register :redmine_absolute_dates do
  name 'Redmine Absolute Dates plugin'
  author 'suer'
  description 'Display absolute create or update dates '
  version '0.0.2'
  url 'https://github.com/suer/redmine_absolute_dates'
  author_url 'http://d.hatena.ne.jp/suer'
end
