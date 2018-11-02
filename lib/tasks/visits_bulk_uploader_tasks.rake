require 'visits_bulk_uploader/uploader'
require 'optionparser'

namespace :visits_bulk_uploader do
  desc 'Import Visits from xml file'
  task import: :environment do
    filters = {}
    path_to_file = ''

    opts = OptionParser.new
    opts.banner = 'Usage: visits_bulk_uploader:import -- --file {path_to_file}'

    opts.on('-f', '--file [FILE]', 'Target file location') do |file|
      path_to_file = file
    end

    opts.on('--min_sum [DECIMAL]', 'Minimum sum') do |val|
      filters[:min_sum] = val.to_f
    end

    opts.on('--max_sum [DECIMAL]', 'Maximum sum') do |val|
      filters[:max_sum] = val.to_f
    end

    opts.on('--min_end_at [DATETIME]', 'Earliest time of visit end') do |val|
      filters[:min_end_at] = val
    end

    opts.on('--max_end_at [DATETIME]', 'Latest time of visit end') do |val|
      filters[:max_end_at] = val
    end

    args = opts.order!(ARGV) {}
    opts.parse!(args)

    raise OptionParser::MissingArgument if path_to_file.empty?

    puts 'Creating Visits'
    @starting_visit_count = Visit.count
    VisitsBulkUploader::Uploader.new(path_to_file, filters).call
    puts "Done. Visits created: #{Visit.count - @starting_visit_count}"
  end
end
