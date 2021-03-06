require 'mail_handler_clean_body_regexp_patch'

Redmine::Plugin.register :redmine_mail_handler_clean_body_regexp do
  name 'Redmine Mail Handler Clean Body Regexp plugin'
  author 'Andrew Hills'
  description 'A Redmine plugin to allow regular expression body trimming on incoming emails'
  version '0.1'
  url 'https://github.com/ahills/redmine_mailclean_regexp'
  author_url 'https://github.com/ahills'
end
