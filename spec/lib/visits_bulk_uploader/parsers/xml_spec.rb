require 'spec_helper'
require 'visits_bulk_uploader/parsers/xml'

describe 'Uploader' do
  sample_location = "#{RSPEC_ROOT}/fixtures/sample.xml"
  let!(:file) { File.open(sample_location) }

  it 'creates Visits' do
    expect do
      VisitsBulkUploader::Parsers::XML.new(file).call
    end.to change { Visit.count }.by(2)
  end

  it 'filters by min sum' do
    expect do
      VisitsBulkUploader::Parsers::XML.new(file, min_sum: 100).call
    end.to change { Visit.count }.by(1)
    expect(Visit.last.sum).to eq(1148.02)
  end

  it 'doesn`t create Visits from invalid xml files' do
    invalid_sample_location = "#{RSPEC_ROOT}/fixtures/not_xml"
    invalid_file = File.open(invalid_sample_location)
    expect do
      VisitsBulkUploader::Parsers::XML.new(invalid_file).call
    end.to change { Visit.count }.by(0)
  end
end
