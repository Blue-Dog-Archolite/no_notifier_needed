require 'test_helper'

class NoNotifierNeededTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, NoNotifierNeeded
  end
end

class TestNoNotifierNeeded < Test::Unit::TestCase
  context 'Responds to expected calls' do
    setup do
      NoNotifierNeeded.configure do |c|
        c.from_name = "NoNotifier"
        c.from_email = "hello@NoNotifier.co"
        c.bcc = "emails@NoNotifier.com"
        c.host = 'http://nonotifier.co'
      end
    end

    #All Modules Exist
    should "Have Rails Loaded And Notifier Exists" do
      assert ActionMailer
      assert NoNotifierNeeded::Render
      assert NoNotifierNeeded::Sender
      assert NoNotifierNeeded::Translate
      assert NoNotifierNeeded::Config
      assert Notifier
    end

    #Model Exists
    should "Have a EmailTemplate" do
      assert EmailTemplate
    end

    #Notifier
    %w{mcp url_for email_link_to}.each do |m|
      should "Respond to #{m}" do
        assert Notifier.method_defined?(m.to_sym)
      end
    end

    #Render
    %w{render_template_subject_type render_template_body_type render_erb render_haml}.each do |c|
      should "Respond to #{c}" do
        assert NoNotifierNeeded::Render.method_defined?(c.to_sym)
        assert Notifier.method_defined?(c.to_sym)
      end
    end
  end
end
