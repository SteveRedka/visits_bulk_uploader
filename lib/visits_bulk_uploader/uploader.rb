require 'nokogiri'
require 'saxerator'

module VisitsBulkUploader
  class Uploader
    def initialize(file_path)
      # def initialize(file_path, sum_min = 0, sum_max = Float::INFINITY,
      #                min_start_at = nil, max_start_at = nil)
      @file = File.open(file_path)
    end

    def call
      parser = Saxerator.parser(@file)
      parser.for_tag(:visit).each do |input|
        input = input.transform_values { |v| v.to_s }
        params = { sum: input['sum'], start_at: input['start_at'],
                   end_at: input['end_at'] }
        visit = Visit.new(params)
        # Assuming id is actually needed
        visit.external_id = input['id'] if visit.respond_to?(:external_id)
        visit.save!
      end
    end
  end
end