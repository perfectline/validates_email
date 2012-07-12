require 'rake'
require 'rake/clean'
require 'rdoc/task'
require 'rspec/core/rake_task'
require 'jeweler'

desc 'Default: run specs.'
task :default => :spec

Jeweler::Tasks.new do |jewel|
  jewel.name            = 'validate_email'
  jewel.summary         = 'Library for validating email addresses in Rails 3 models.'
  jewel.email           = ['tanel.suurhans@perfectline.ee', 'tarmo.lehtpuu@perfectline.ee']
  jewel.homepage        = 'http://github.com/perfectline/validates_email/tree/master'
  jewel.description     = 'Library for validating email addresses in Rails 3 models.'
  jewel.authors         = ["Tanel Suurhans", "Tarmo Lehtpuu"]
  jewel.files           = FileList["lib/**/*.rb", "lib/locale/*.yml", "*.rb", "MIT-LICENCE", "README.markdown"]

  jewel.add_development_dependency 'rspec'
  jewel.add_development_dependency 'diff-lcs', '>= 1.1.2'
  jewel.add_development_dependency 'active_record', '>= 3.0.0'
  jewel.add_development_dependency 'sqlite3-ruby'

  jewel.add_dependency  'mail', '>= 2.2.5'
  jewel.add_dependency  'activemodel', '>= 3.0'
end

desc 'Generate documentation plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ValidatesEmail'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.markdown')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc 'Run all rspec tests'
RSpec::Core::RakeTask.new
