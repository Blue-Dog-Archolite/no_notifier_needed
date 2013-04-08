module NoNotifierNeeded
  module Translate
    def get_send_hash(template)
      send_hash = {}
      NoNotifierNeeded::Config::VALID_OPTIONS_KEYS.each do |k|
        send_hash[k] = NoNotifierNeeded.send(k)
      end

      send_hash[:subject] = render_template_subject_type(@template)

      send_hash[:to] = @to if @to
      send_hash[:to] ||= @user.email if @user
      send_hash[:to] ||= template.sent_to.split(',')

      send_hash[:from] = @from unless @from.blank?
      send_hash[:from] ||= "#{send_hash.delete(:from_name)} <#{send_hash.delete(:from_email)}>"
      send_hash[:from] ||= "#{template.from_name} <#{template.from_email}>" unless template.from_name.blank? || template.from_email.blank?

      send_hash[:cc] = @cc.nil? ? nil : @cc

      send_hash[:reply_to] = @reply_to unless @reply_to.blank?
      send_hash[:reply_to] ||= "#{template.reply_to}" unless template.reply_to.blank?

      send_hash
    end

    def args_to_instance_vars(args)
      #take each key, if a model, make it an @#{model} = model.find(value)
      #else make it a @#{name}=#{value}

      args.each do |k,v|
        if Object.const_defined?(k.classify) && known_models.include?(k.classify.constantize)
          self.instance_eval("@#{k}= #{k.classify}.find(#{v})")
        else
          if v.is_a?(String)
            self.instance_eval("@#{k} = \"#{v}\"")
          else
            self.instance_eval("@#{k}=#{v}")
          end
        end
      end

      if args.has_key?("current_user")
        k = NoNotifierNeeded.send(:current_user_model)
        self.instance_eval("@current_user = #{k.classify}.find(#{args['current_user']})")
      end
    end

    def known_models
      @known_models if @known_models
      @known_models = ActiveRecord::Base.send( :descendants ).flatten.uniq
      @known_models += @known_models.collect{|k| k.send(:descendants) }.flatten.uniq
      @known_models.uniq!
      @known_models
    end
  end
end
