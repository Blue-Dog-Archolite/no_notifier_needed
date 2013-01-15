require 'no_notifier_needed/send'
require 'no_notifier_needed/translate'
require 'no_notifier_needed/render'
require 'no_notifier_needed/sender'
require 'no_notifier_needed/config'

module NoNotifierNeeded
  extend Config
  extend Send
#  include Render
#  include Translate
#  include Sender

  def self.sender(options={})
    NoNotifierNeeded::Sender.new(options)
  end

  def self.configure
    yield self
  end

  def self.method_missing(method, *args, &block)
    return super unless sender.respond_to?(method)
    sender.send(method, *args, &block)
  end

  # Delegate to Instagram::Client
  def self.respond_to?(method)
    return sender.respond_to?(method) || super
  end
end

require 'no_notifier_needed/railtie.rb' if defined?(Rails)
