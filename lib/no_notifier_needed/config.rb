module NoNotifierNeeded
  module Config

    VALID_OPTIONS_KEYS = [
      :from_email,
      :from_name,
      :bcc,
      :reply_to,
      :host,
      :controller,
      :action,
      :mandrill_user_name,
      :mandrill_password,
      :mandrill_port,
      :current_user_model,
      :current_user_id_method,
      :gmail_password,
      :gmail_user_name,
      :domain
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
