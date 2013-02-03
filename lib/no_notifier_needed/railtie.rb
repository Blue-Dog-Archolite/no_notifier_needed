module NoNotifierNeeded
  class Railtie < Rails::Railtie
    initializer "Include code in controller" do
      ActiveSupport.on_load(:action_controller) do
        require File.expand_path('../../../initializers/notifier',  __FILE__)

        #Pass defaults to allow for this to work
        Notifier.send(:include, Rails.application.routes.url_helpers) # brings ActionDispatch::Routing::UrlFor
        Notifier.send(:include, ActionView::Helpers::UrlHelper)
        Notifier.send(:include, ActionView::Helpers::TextHelper)
        Notifier.send(:include, ActionView::Helpers::TagHelper)

        Notifier.send(:include, NoNotifierNeeded::Render)
        Notifier.send(:include, NoNotifierNeeded::Translate)
        Notifier.send(:extend, NoNotifierNeeded::Send)
      end
    end
  end
end
