class EmailTemplate < ActiveRecord::Base
  before_save :clean_inputs

  attr_accessible :body, :subject, :name, :template_type, :sent_to, :when_sent,
    :email_template_comments_attributes, :from_name, :from_email, :reply_to, :send_via_mandrill,
    :send_via_gmail

  def clean_inputs
    body.strip!
    subject.strip!
  end
end
