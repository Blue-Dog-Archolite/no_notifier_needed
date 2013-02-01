class Notifier < ActionMailer::Base
#  helper :application, :notifier

  #Includes to Help with Rendering
  include Rails.application.routes.url_helpers # brings ActionDispatch::Routing::UrlFor
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::TagHelper

  include NoNotifierNeeded::Render
  include NoNotifierNeeded::Translate
  extend NoNotifierNeeded::Send

  def mcp(email_name, args)
    @template = EmailTemplate.find_by_name(email_name)
    raise "Email Template name not found" if @template.nil?

    args_to_instance_vars(args)

    send_hash = get_send_hash(@template)
    mail_is = mail(send_hash) do|format|
      format.html { render :inline => render_template_body_type(@template) }
    end

    return mail_is
  end

  def url_for(destination)
    unless destination.is_a?(Hash) || destination.match(/_path/i)
      raise ArgumentError.new(" must pass something that ends with a _path. #{destination} sent.")
    end
    to_send = "Rails.application.routes.url_helpers.#{destination}"
    instance_eval to_send
  end

  def email_link_to(title, link)
    return title if link.blank?
    if link.match(/http:\/\/[\w*\.]*\//i)
      root_link = link
    else
      splitter = NoNotifierNeeded.send(:host).split('/').last

      link_broken = link.split(splitter).last
      link_broken = link_broken.split('/').reject{|e| e.blank?}.join('/')
      if NoNotifierNeeded.send(:host).last == "/"
        root_link = NoNotifierNeeded.send(:host) + link_broken
      else
        root_link = NoNotifierNeeded.send(:host) + "/" + link_broken
      end
    end
    "<a href='#{root_link}'>#{title}</a>"
  end
end