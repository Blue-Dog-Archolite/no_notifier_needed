# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "no_notifier_needed"
  s.version = "2.0.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Robert R. Meyer"]
  s.date = "2013-02-04"
  s.description = "A work in progress: Replace ActionMailer::Base class redundency. Temlating using haml or erb."
  s.email = "Blue.Dog.Archolite@gmail.com"
  s.extra_rdoc_files = [
    "README.css",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rvmrc",
    "Gemfile",
    "Gemfile.lock",
    "README.css",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "initializers/notifier.rb",
    "lib/generators/no_notifier_needed/install_generator.rb",
    "lib/generators/no_notifier_needed/templates/email_template.rb",
    "lib/generators/no_notifier_needed/templates/install.rb",
    "lib/generators/no_notifier_needed/templates/jobs/email_processor.rb",
    "lib/generators/no_notifier_needed/templates/no_notifier_needed_initalizer.rb",
    "lib/no_notifier_needed.rb",
    "lib/no_notifier_needed/config.rb",
    "lib/no_notifier_needed/railtie.rb",
    "lib/no_notifier_needed/render.rb",
    "lib/no_notifier_needed/send.rb",
    "lib/no_notifier_needed/sender.rb",
    "lib/no_notifier_needed/translate.rb",
    "lib/no_notifier_needed/url_helper.rb",
    "lib/no_notifier_needed/version.rb",
    "lib/tasks/no_notifier_needed_tasks.rake",
    "no_notifier_needed.gemspec",
    "test/dummy/README.rdoc",
    "test/dummy/Rakefile",
    "test/dummy/app/assets/javascripts/application.js",
    "test/dummy/app/assets/stylesheets/application.css",
    "test/dummy/app/controllers/application_controller.rb",
    "test/dummy/app/helpers/application_helper.rb",
    "test/dummy/app/mailers/.gitkeep",
    "test/dummy/app/models/.gitkeep",
    "test/dummy/app/models/email_template.rb",
    "test/dummy/app/views/layouts/application.html.erb",
    "test/dummy/config.ru",
    "test/dummy/config/application.rb",
    "test/dummy/config/boot.rb",
    "test/dummy/config/database.yml",
    "test/dummy/config/environment.rb",
    "test/dummy/config/environments/development.rb",
    "test/dummy/config/environments/production.rb",
    "test/dummy/config/environments/test.rb",
    "test/dummy/config/initializers/backtrace_silencers.rb",
    "test/dummy/config/initializers/inflections.rb",
    "test/dummy/config/initializers/mime_types.rb",
    "test/dummy/config/initializers/secret_token.rb",
    "test/dummy/config/initializers/session_store.rb",
    "test/dummy/config/initializers/wrap_parameters.rb",
    "test/dummy/config/locales/en.yml",
    "test/dummy/config/routes.rb",
    "test/dummy/db/test.sqlite3",
    "test/dummy/lib/assets/.gitkeep",
    "test/dummy/log/.gitkeep",
    "test/dummy/log/development.log",
    "test/dummy/log/test.log",
    "test/dummy/public/404.html",
    "test/dummy/public/422.html",
    "test/dummy/public/500.html",
    "test/dummy/public/favicon.ico",
    "test/dummy/script/rails",
    "test/test_helper.rb",
    "test/test_no_notifier_needed.rb"
  ]
  s.homepage = "http://github.com/Blue-Dog-Archolite/no_notifier_needed"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "A Gem used to remove ActionMailer::Base class and and provide Templates"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<haml>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, [">= 3.2.11"])
      s.add_runtime_dependency(%q<metric_fu>, [">= 0"])
      s.add_runtime_dependency(%q<facets>, ["~> 2.9.3"])
      s.add_development_dependency(%q<rails-pry>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, [">= 1.2.3"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<haml>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 3.2.11"])
      s.add_dependency(%q<metric_fu>, [">= 0"])
      s.add_dependency(%q<facets>, ["~> 2.9.3"])
      s.add_dependency(%q<rails-pry>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, [">= 1.2.3"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<haml>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 3.2.11"])
    s.add_dependency(%q<metric_fu>, [">= 0"])
    s.add_dependency(%q<facets>, ["~> 2.9.3"])
    s.add_dependency(%q<rails-pry>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, [">= 1.2.3"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

