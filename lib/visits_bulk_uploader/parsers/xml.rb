require 'nokogiri'
require 'saxerator'

module VisitsBulkUploader
  module Parsers
    # Parse xml for visits
    class XML
      def initialize(file)
        @file = file
      end

      def call
        parser = Saxerator.parser(@file)
        parser.for_tag(:visit).each do |input|
          input = input.transform_values { |v| v.to_s }
          params = { sum: input['sum'], start_at: input['start_at'],
                     end_at: input['end_at'] }
          next unless passes_filters?

          visit = Visit.new(params)
          # Assuming id is actually needed
          visit.external_id = input['id'] if visit.respond_to?(:external_id)
          visit.save!
        end
      end

      private

      def passes_filters?
        true
      end
    end
  end
end
