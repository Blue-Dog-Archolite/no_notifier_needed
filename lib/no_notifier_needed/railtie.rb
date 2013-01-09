module NoNotifierNeeded
  class Railtie < Rails::Railtie
    initializer "Include code in controller" do
      ActiveSupport.on_load(:action_controller) do

        #::ActionMailer::Base.send(:include, ActionView::Helpers::)
        ::ActionMailer::Base.send(:include, Rails.application.routes.url_helpers) # brings ActionDispatch::Routing::UrlFor
        ::ActionMailer::Base.send(:include, ActionView::Helpers::UrlHelper)
        ::ActionMailer::Base.send(:include, ActionView::Helpers::TextHelper)
      end
    end
  end
end
