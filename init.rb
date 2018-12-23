require 'redmine'

ApplicationHelper.prepend(AbsoluteDateHelperPatch::ApplicationHelperWithAbsoluteDate)

Rails.application.config.i18n.load_path += Dir["#{File.dirname(__FILE__)}/config/locales/*.{rb,yml}"]

Redmine::Plugin.register :redmine_absolute_dates do
  name 'Redmine Absolute Dates plugin'
  author 'suer'
  description 'Display absolute create or update dates '
  version '0.0.4'
  url 'https://github.com/suer/redmine_absolute_dates'
  author_url 'http://d.hatena.ne.jp/suer'
end
