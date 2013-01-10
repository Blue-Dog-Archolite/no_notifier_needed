module NoNotifierNeeded
  module Configuration

    VALID_OPTIONS_KEYS = [
      :from,
      :bcc,
      :reply_to,
      :host,
      :controller,
      :action
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
