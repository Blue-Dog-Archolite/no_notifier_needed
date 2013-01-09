require 'no_notifier_needed/send'
require 'no_notifier_needed/translate'
require 'no_notifier_needed/render'


module NoNotifierNeeded
  include NoNotifierNeeded::Send
  include NoNotifierNeeded::Translate
  include NoNotifierNeeded::Render

end

require 'no_notifier_needed/railtie.rb' if defined?(Rails)
::ActionMailer::Base.extend NoNotifierNeeded
