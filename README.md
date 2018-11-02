# VisitsBulkUploader
Test task for MSTlab.

There is a hypothetical app. It has model `Visit`. This gem extends it with ability to create `Visits` from xml files which may contain hundreds of thousands of records.

## Usage
To use it as rake task:
```
rake visits_bulk_uploader:import -- --file {path_to_file} [--min_sum DECIMAL --max_sum DECIMAL --min_end_at DATETIME --max_end_at DATETIME]

# Examples: 
visits_bulk_uploader:import -- --file /tmp/visits.xml
visits_bulk_uploader:import -- --file /tmp/visits.xml --min_sum 100
visits_bulk_uploader:import -- --file /tmp/visits.xml --min_end_at 3.2.2001 04:05
```
To use it within the project:
```
require 'visits_bulk_uploader/uploader'

path_to_file = '/tmp/sample.xml'
filters = { min_sum: 100, max_sum: 200, 
            max_end_at: 3.days.ago, min_end_at: 5.days.ago }

VisitsBulkUploader::Uploader.new(path_to_file, filters).call
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'visits_bulk_uploader'
```

And then execute:
```bash
$ bundle
```

## Assumptions
The gem assumes that field `id` is used to serialize `Visits` in different database, and doesn't assign that directly.
