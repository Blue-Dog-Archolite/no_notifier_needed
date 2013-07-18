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
    ].freeze

    SECURE_OPTIONS_KEYS = [
      #mandrill options
      :mandrill_user_name,
      :mandrill_password,
      :mandrill_port,

      #Gmail options
      :gmail_user_name,
      :gmail_password,
      :gmail_domain,

      #current User options
      :current_user_model,
      :current_user_id_method,
    ].freeze

    # @private
    attr_accessor *VALID_OPTIONS_KEYS
    attr_accessor *SECURE_OPTIONS_KEYS

    # Create a hash of options and their values
    def options
      (SECURE_OPTIONS_KEYS + VALID_OPTIONS_KEYS).inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end
  end
end
