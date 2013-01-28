class <%= migration_class_name %> < ActiveRecord::Migration
  def self.up
    create_table :email_templates do |t|
      t.timestamps
      t.string :from_email
      t.string :from_name
      t.string :bcc
      t.string :reply_to
    end
  end

  def down
    drop_table :email_templates
  end
end
