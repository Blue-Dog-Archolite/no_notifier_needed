module NoNotifierNeeded
  class Railtie < Rails::Railtie
    initializer "Include code in controller" do
      ActiveSupport.on_load(:action_controller) do

        #TODO
        #Pass defaults to allow for this to work
        #::ActionMailer::Base.send(:include, ActionView::Helpers::)
        NoNotifierNeeded::Sender.send(:include, Rails.application.routes.url_helpers) # brings ActionDispatch::Routing::UrlFor
        NoNotifierNeeded::Sender.send(:include, ActionView::Helpers::UrlHelper)
        NoNotifierNeeded::Sender.send(:include, ActionView::Helpers::TextHelper)
      end
    end
  end
end
