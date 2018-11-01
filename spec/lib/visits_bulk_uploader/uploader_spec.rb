require 'spec_helper'
require 'visits_bulk_uploader/uploader'

describe 'Uploader' do
  sample_location = "#{RSPEC_ROOT}/fixtures/sample.xml"

  it 'creates Visits' do
    expect do
      VisitsBulkUploader::Uploader.new(sample_location).call
    end.to change { Visit.count }.by(2)
  end
end
