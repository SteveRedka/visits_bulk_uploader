require 'visits_bulk_uploader/uploader'
require 'optionparser'

namespace :visits_bulk_uploader do
  desc 'Import Visits from xml file'
  task :import do
    options = {}

    opts = OptionParser.new
    opts.banner = 'Usage: visits_bulk_uploader:import -- --file {path_to_file}'
    opts.on('--file FILE') do |file|
      options[:path_to_file] = file
    end

    args = opts.order!(ARGV) {}
    opts.parse!(args)

    VisitsBulkUploader::Uploader.new(options[:path_to_file]).call
  end
end
