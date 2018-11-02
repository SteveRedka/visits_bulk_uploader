require 'visits_bulk_uploader/parsers/xml'

module VisitsBulkUploader
  class Uploader
    def initialize(file_path)
      # def initialize(file_path, sum_min = 0, sum_max = Float::INFINITY,
      #                min_start_at = nil, max_start_at = nil)
      @file = File.open(file_path)
    end

    def call
      VisitsBulkUploader::Parsers::XML.new(@file).call
    end
  end
end
