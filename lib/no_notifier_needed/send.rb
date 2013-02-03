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
      Resque.enqueue_at(time_from_now, EmailProcessor, email_hash)
    end

    private
    def translate_to_hash(which_email, args)
      th = {}
      th[:which_email] = which_email

      args = args.flatten if args.respond_to?(:flatten)
      args.each do |a|
        next if a.blank?
        if known_models.include?(a.class.name)
          th[a.class.name.downcase.to_sym] = a.id
        elsif a.is_a?(Hash)
          a.each{|k,v| th[k.to_sym] = CGI.escapeHTML(v) }
        else
          raise ArgumentError.new("Unknown #{a.class} passed to email procesor. \n Object #{a.inspect} \n\n WhichEmail: #{which_email} \n Args #{pp args} \n\n Known Models #{known_models}")
        end
      end
      th
    end
  end
end
