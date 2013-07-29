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


    #configure this to only run as one block depending on what the template responds to

    if @template.respond_to?(:send_via_mandrill) && @template.send_via_mandrill?
      Notifier.smtp_settings = {
        :address   => "smtp.mandrillapp.com",
        :port      => NoNotifierNeeded.mandrill_port,
        :enable_starttls_auto => true, # detects and uses STARTTLS
        :user_name => NoNotifierNeeded.mandrill_user_name,
        :password  => NoNotifierNeeded.mandrill_password,
        :authentication => 'login' # Mandrill supports 'plain' or 'login'
      }

    elsif @template.respond_to?(:send_via_gmail) && @template.send_via_gmail?
      pwd = NoNotifierNeeded.gmail_password.first
      Notifier.smtp_settings = {
        :address    => 'smtp.gmail.com',
        :port       =>  587,
        :domain     => NoNotifierNeeded.gmail_domain,
        :user_name  => NoNotifierNeeded.gmail_user_name,
        :password   => pwd,
        :authentication => 'login',
        :enable_starttls_auto => true
      }
    end

    @template.params = args
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

  def email_link_to(title, link, opts={})
    return title if link.blank?
    if link.match(/http:|https:\/\/[\w*\.]*\//i)
      root_link = link
    else
      root_link = email_href_for(link)
    end
    "<a href='#{root_link}' #{html_opts(opts)}>#{title}</a>"
  end

  def email_href_for(link)
    splitter = NoNotifierNeeded.send(:host).split('/').last

    link_broken = link.split(splitter).last
    link_broken = link_broken.split('/').reject{|e| e.blank?}.join('/')
    if NoNotifierNeeded.send(:host).last == "/"
      root_link = NoNotifierNeeded.send(:host) + link_broken
    else
      root_link = NoNotifierNeeded.send(:host) + "/" + link_broken
    end
  end

  def html_opts(opts)
    to_ret = []
    opts.each do |k,v|
      to_ret << "#{k.to_s}='#{v}'"
    end
    to_ret.join(" ")
  end

end
