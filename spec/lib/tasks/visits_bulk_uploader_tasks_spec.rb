# Supress ARGV warnings
$VERBOSE = nil

require 'spec_helper'
require 'rake'
Rake::Task.define_task(:environment)
load File.expand_path("#{RSPEC_ROOT}/../lib/tasks/visits_bulk_uploader_tasks.rake")

describe 'visits_bulk_uploader_tasks' do
  let :run_rake_task do
    Rake::Task['visits_bulk_uploader:import'].reenable
    Rake::Task['visits_bulk_uploader:import'].invoke
  end

  sample_location = "#{RSPEC_ROOT}/fixtures/sample.xml"
  describe ':import' do
    it 'works' do
      # Emulate task call with arguments
      ARGV = ['__FILE__', '--', '--file', sample_location]
      expect { run_rake_task }.to change { Visit.count }.by(2)
    end

    it 'raises an error if no location is given' do
      ARGV = ['__FILE__']
      expect { run_rake_task }.to raise_error(OptionParser::MissingArgument)
    end

    describe 'filters' do
      it 'processes min_sum' do
        ARGV = ['__FILE__', '--', '--file', sample_location, '--min_sum', '100']
        expect { run_rake_task }.to change { Visit.count }.by(1)
      end

      it 'processes max_sum' do
        ARGV = ['__FILE__', '--', '--file', sample_location, '--max_sum', '100']
        expect { run_rake_task }.to change { Visit.count }.by(1)
      end

      it 'processes min_end_at' do
        ARGV = ['__FILE__', '--', '--file', sample_location,
                '--min_end_at', '2018-10-26-12:00']
        expect { run_rake_task }.to change { Visit.count }.by(1)
      end

      it 'processes max_end_at' do
        ARGV = ['__FILE__', '--', '--file', sample_location,
                '--max_end_at', '2018-10-26-12:00']
        expect { run_rake_task }.to change { Visit.count }.by(1)
      end
    end
  end
end
