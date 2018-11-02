require 'spec_helper'
require 'visits_bulk_uploader/uploader'

describe 'Uploader' do
  sample_location = "#{RSPEC_ROOT}/fixtures/sample.xml"
  invalid_sample_location = "#{RSPEC_ROOT}/fixtures/not_xml"

  it 'creates Visits from valid xml files' do
    expect do
      VisitsBulkUploader::Uploader.new(sample_location).call
    end.to change { Visit.count }.by(2)
  end

  it 'doesn`t create Visits from invalid xml files' do
    expect do
      VisitsBulkUploader::Uploader.new(invalid_sample_location).call
    end.to change { Visit.count }.by(0)
  end
end
