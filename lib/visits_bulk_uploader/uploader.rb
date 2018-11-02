require 'visits_bulk_uploader/parsers/xml'

module VisitsBulkUploader
  class Uploader
    def initialize(file_path, filters = {})
      @file = File.open(file_path)
      @filters = filters
    end

    def call
      VisitsBulkUploader::Parsers::XML.new(@file, @filters).call
    end
  end
end
