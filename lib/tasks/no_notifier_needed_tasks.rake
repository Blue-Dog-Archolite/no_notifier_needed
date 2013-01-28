namespace :no_notifier_needed do
  desc "install the default files and migration"
  task :install do
    load File.expand_path(File.join(File.dirname(__FILE__), "..", "generators", "install_generator.rb"))
  end
end
