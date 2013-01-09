module NoNotifierNeeded
  require 'no_notifier_needed/send'
  require 'no_notifier_needed/translate'
  require 'no_notifier_needed/render'

end

::Notifier.send(:include, NoNotifierNeeded)
