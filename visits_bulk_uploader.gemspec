$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require 'visits_bulk_uploader/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'visits_bulk_uploader'
  s.version     = VisitsBulkUploader::VERSION
  s.authors     = ['Steve Redka']
  s.email       = ['cogitofallacy@gmail.com']
  s.summary     = 'MST test task'
  s.description = 'Parses XML files. Creates Visits from them.'
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'nokogiri'
  s.add_dependency 'rails', '~> 5.2.1'
  s.add_dependency 'saxerator'

  s.add_development_dependency 'activerecord'
  s.add_development_dependency 'byebug'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
end
