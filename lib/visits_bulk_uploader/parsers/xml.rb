require 'nokogiri'
require 'saxerator'
require 'visits_bulk_uploader/filter'

module VisitsBulkUploader
  module Parsers
    # Parse xml for visits
    class XML
      def initialize(file, filters = {})
        @file = file
        @filters = filters
      end

      def call
        parser = Saxerator.parser(@file)
        parser.for_tag(:visit).each do |input|
          input = input.transform_values(&:to_s)
          @params = { sum: input['sum'].to_f, start_at: input['start_at'],
                      end_at: input['end_at'] }

          next unless VisitsBulkUploader::Filter.new(@params, @filters).passes?

          visit = Visit.create!(@params)
        end
      end
    end
  end
end
