require 'spec_helper'
require 'rake'
load File.expand_path("#{RSPEC_ROOT}/../lib/tasks/visits_bulk_uploader_tasks.rake")

describe 'visits_bulk_uploader_tasks' do
  sample_location = "#{RSPEC_ROOT}/fixtures/sample.xml"
  describe ':import' do
    it 'works' do
      # Emulate task call with arguments
      ARGV = ['__FILE__', '--', '--file', sample_location]
      expect do
        Rake::Task['visits_bulk_uploader:import'].invoke
      end.to change { Visit.count }.by(2)
    end
  end
end
