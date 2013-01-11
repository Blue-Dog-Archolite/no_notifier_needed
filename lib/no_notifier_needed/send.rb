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
  end
end
