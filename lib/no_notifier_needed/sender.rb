module NoNotifierNeeded
  module Sender
    def mcp(email_name, args)
      @template = EmailTemplate.find_by_name(email_name)
      raise "Email Template name not found" if @template.nil?

      debugger

      raise @email_template.inspect
      if @template.send_via_mandrill?
        raise "FUCK OFF"
        self.smtp_settings = {
          :address   => "smtp.mandrillapp.com",
          :port      => 25, # or 587
          :enable_starttls_auto => true, # detects and uses STARTTLS
          :user_name => NoNotifierNeeded.mandrill_user_name,
          :password  => NoNotifierNeeded.mandrill_password,
          :authentication => 'login' # Mandrill supports 'plain' or 'login'
        }
      end

      args_to_instance_vars(args)

      mail_is = mail(get_send_hash) do|format|
        format.html { render :inline => render_template_body_type(@template) }
      end

      return mail_is
    end
  end
end

