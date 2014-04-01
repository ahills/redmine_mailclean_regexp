require_dependency 'mail_handler'

module MailHandlerRegexpPatch
    def self.included(base) # :nodoc:
        base.send(:include, InstanceMethods)

        base.class_eval do
            alias_method_chain :cleanup_body, :regexp
        end
    end

    module InstanceMethods
        def cleanup_body_with_regexp(body)
            delimiters = Setting.mail_handler_body_delimiters.to_s.split(/[\r\n]+/).reject(&:blank?)
            unless delimiters.empty?
                regex = Regexp.new("^[> ]*(#{ delimiters.join('|') })\s*[\r\n].*", Regexp::MULTILINE)
                body = body.gsub(regex, '')
            end
            body.strip
        end
    end
end

MailHandler.send(:include, MailHandlerRegexpPatch)

