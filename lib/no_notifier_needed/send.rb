module NoNotifierNeeded
  module Send
    def send_now(which_email, *args)
      email_hash = translate_to_hash(which_email, args)
      Resque.enqueue(EmailProcessor, email_hash)
    end

    def send_in(time_from_now, which_email, *args)
      email_hash = translate_to_hash(which_email, args)
      Resque.enqueue_at(time_from_now, EmailProcessor, email_hash)
    end

    def send_at(what_time, which_email, *args)
      email_hash = translate_to_hash(which_email, args)
      time_from_now = what_time.is_a?(Time) ? what_time : Chronic.parse(what_time)
      raise ActionDispatch::Request.new(ENV).session.inspect
      Resque.enqueue_at(time_from_now, EmailProcessor, email_hash)
    end

    private
    def known_models
      @known_models if @known_models
      @known_models = ActiveRecord::Base.send( :descendants ).flatten.uniq
      @known_models += @known_models.collect{|k| k.send(:descendants) }.flatten.uniq
      @known_models.uniq!
      @known_models
    end

    def translate_to_hash(which_email, args)
      th = {}
      th[:which_email] = which_email

      if NoNotifierNeeded.send(:current_user_model)
        th[:current_user] = instance_eval(NoNotifierNeeded.send(:current_user_id_method))
      end

      args = args.flatten if args.respond_to?(:flatten)
      args.each do |a|
        next if a.blank?
        if a.is_a?(Hash)
          a.each do|k,v|
            if v.respond_to?(:gsub)
              th[k.to_sym] = CGI.escapeHTML(v)
            else
              th[k.to_sym] = v
            end
          end
        elsif known_models.include?(a.class.name) || a.class.respond_to?(:column_names)
          th[a.class.name.downcase.to_sym] = a.id
        else
          raise ArgumentError.new("Unknown #{a.class} passed to email procesor. \n Object #{a.inspect} \n\n WhichEmail: #{which_email} \n Args #{args} \n\n Known Models #{known_models}")
        end
      end
      th
    end
  end
end
