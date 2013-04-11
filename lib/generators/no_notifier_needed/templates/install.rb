class <%= migration_class_name %> < ActiveRecord::Migration
  def self.up
    create_table :email_templates do |t|
      t.timestamps
      t.string :from_email
      t.string :from_name
      t.string :bcc
      t.string :reply_to
      t.string :body
      t.string :template_type
      t.boolean :send_via_mandrill, :default => false, :null => false
      t.integer :email_template_type_id
    end

    create_table :email_template_types do |t|
      t.string :type
      t.boolean :critical, :default => false, :null => false
    end

    create_table :email_template_types_users do |t|
      t.integer :email_template_id
      t.integer :user_id
    end

    add_index :email_tt_users, [:email_template_id, :user_id]
    add_index :users_email_tt, [:user_id, :email_template_id]
  end

  def down
    drop_table :email_templates
    drop_table :email_templates_type
    drop_table :email_template_types_users
  end
end
