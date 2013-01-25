module NoNotifierNeeded
  module Translate
    def get_send_hash(template)
      send_hash = base_send_hash(template)
      send_hash[:subject] = render_template_subject_type(@template)
      send_hash[:to] = @to.nil? ? @user.email : @to
      send_hash[:from] = @from unless @from.nil?
      send_hash[:reply_to] = @reply_to unless @reply_to.nil?
      send_hash
    end

    def base_send_hash(template)
      base = {}
      NoNotifierNeeded::Config::VALID_OPTIONS_KEYS.each do |k|
        base[k] = NoNotifierNeeded.send(k)
      end
      base[:from] = "#{base.delete(:from_name)} <#{base.delete(:from_email)}>"
      base[:from] = "#{template.from_name} <#{template.from_email}>" if template.from_name && template.from_email
      base[:reply_to] = "#{template.reply_to}" if template.reply_to
      base
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
    end

    def known_models
      @known_models if @known_models
      @known_models = ActiveRecord::Base.send( :subclasses )
#      @known_models += @known_models.collect{|k| k.send(:subclasses) }.flatten.uniq
#      @known_models.uniq!
      @known_models
    end
  end
end
