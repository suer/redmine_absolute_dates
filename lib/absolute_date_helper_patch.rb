module AbsoluteDateHelperPatch
  module ApplicationHelperWithAbsoluteDate
    def authoring(created, author, options={})
      #l(options[:label] || :label_added_time_by, :author => link_to_user(author), :age => time_tag(created)).html_safe
      l(options[:label] || :label_added_absolute_time_by, :author => link_to_user(author), :age => time_tag(created)).html_safe
    end

    def time_tag(time)
      zone = User.current.time_zone
      local = zone ? time.in_time_zone(zone) : (time.utc? ? time.localtime : time)
      text = format_date(local)
      tip_text = format_time(time)
      if @project
        link_to(text, {:controller => 'activities', :action => 'index', :id => @project, :from => local.to_date}, :title => tip_text).html_safe
      else
        content_tag('acronym', text, :title => tip_text).html_safe
      end
    end
  end
end
