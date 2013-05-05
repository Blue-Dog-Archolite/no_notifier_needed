module NoNotifierNeeded
  module Config

    VALID_OPTIONS_KEYS = [
      #Defaults
      :from_email,
      :from_name,
      :bcc,
      :reply_to,

      #Url Options
      :host,
      :controller,
      :action,

      #mandrill options
      :mandrill_user_name,
      :mandrill_password,
      :mandrill_port,

      #current User options
      :current_user_model,
      :current_user_id_method,

      #Gmail options
      :gmail_user_name,
      :gmail_password,
      :gmail_domain
    ].freeze

    # @private
    attr_accessor *VALID_OPTIONS_KEYS

    # Create a hash of options and their values
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end
  end
end
