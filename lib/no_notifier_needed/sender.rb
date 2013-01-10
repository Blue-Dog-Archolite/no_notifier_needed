module NoNotifierNeeded
  class Sender < ActionMailer::Base
    include Render
    include Translate

  end
end
