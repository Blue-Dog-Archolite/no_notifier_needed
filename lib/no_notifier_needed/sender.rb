module NoNotifierNeeded
  module Sender
    def mcp(email_name, args)
      @template = EmailTemplate.find_by_name(email_name)
      raise "Email Template name not found" if @template.nil?

      args_to_instance_vars(args)

      mail_is = mail(get_send_hash) do|format|
        format.html { render :inline => render_template_body_type(@template) }
      end

      return mail_is
    end
  end
end

