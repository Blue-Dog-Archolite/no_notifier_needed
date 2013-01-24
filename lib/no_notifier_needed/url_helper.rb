module NoNotifierNeeded
  module UrlHelper
    def url_for(destination)
      unless destination.is_a?(Hash) || destination.match(/_path/i)
        raise ArgumentError.new(" must pass something that ends with a _path. #{destination} sent.")
      end
      to_send = "Rails.application.routes.url_helpers.#{destination}"
      instance_eval to_send
    end
  end
end
