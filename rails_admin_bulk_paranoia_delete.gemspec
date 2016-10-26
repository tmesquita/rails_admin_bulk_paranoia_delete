$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_bulk_paranoia_delete/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_bulk_paranoia_delete"
  s.version     = RailsAdminBulkParanoiaDelete::VERSION
  s.authors     = ["Thomas Mesquita"]
  s.email       = ["thomasxmesquita@gmail.com"]
  s.homepage    = ""
  s.summary     = "Custom action to bulk delete objects that acts_as_paranoid via the paranoia gem"
  s.description = "rails_admin bulk_delete action incorrectly displays an error when model is using acts_as_paranoid provided by the paranoia gem. This custom action is to provide an alternative that will work correctly with paranoia."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.22.5"
end
