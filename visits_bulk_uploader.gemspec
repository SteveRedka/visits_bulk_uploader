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

  s.add_dependency 'rails', '~> 5.2.1'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec'
end
