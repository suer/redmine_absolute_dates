module AbsoluteDateHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :authoring, :absolute_date
      alias_method_chain :time_tag, :absolute_date
    end
  end

  module InstanceMethods
    # Adds a rates tab to the user administration page
    def authoring_with_absolute_date(created, author, options={})
      l(options[:label] || :label_added_absolute_time_by, :author => link_to_user(author), :age => time_tag(created)).html_safe
    end

    def time_tag_with_absolute_date(time)
      text = format_date(time)
      tip_text = format_time(time)
      if @project
        link_to(text, {:controller => 'activities', :action => 'index', :id => @project, :from => time.to_date}, :title => tip_text).html_safe
      else
        content_tag('acronym', text, :title => tip_text).html_safe
      end
    end

  end
end
