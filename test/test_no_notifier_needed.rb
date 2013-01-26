require 'helper'
require 'test_helper'

class TestNoNotifierNeeded < Test::Unit::TestCase
  context 'Responds to expected calls' do
  setup do

  end
  #All Modules Exist
  should "Have Rails Loaded And Notifier Exists" do
    assert ActionMailer
    assert Notifier
    assert NoNotifierNeeded::Render
    assert NoNotifierNeeded::Sender
    assert NoNotifierNeeded::Translate
    assert NoNotifierNeeded::Config
  end

  #Model Exists
  should "Have a EmailTemplate" do
    assert EmailTemplate
  end

  #Notifier
  %w{mcp url_for email_link_to}.each do |m|
    should "Respond to #{m}" do
      assert Notifier.instance_methods.include?(m.to_sym)
    end
  end

  #Render
  %w{render_template_subject_type render_template_body_type render_erb render_haml}.each do |c|
    should "Respond to #{c}" do
      assert NoNotifierNeeded::Render.instance_methods.include?(c.to_sym)
      assert Notifier.instance_methods.include?(c.to_sym)
    end
  end
end
end
