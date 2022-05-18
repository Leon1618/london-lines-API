require 'open-uri'
require 'json'

ENDPOINT = 'https://api.tfl.gov.uk/line/mode/tube,overground,dlr,tflrail/status'

json_data = URI.open(ENDPOINT).read

JSON.parse(json_data).each do |line|
  status = line['lineStatuses'].first['statusSeverityDescription']
  # Write the code to store the line's names
  name = line['name']
  
  # Display the status for each line:
  puts "#{name} has #{status}"
  
  if line['lineStatuses'].first['reason']
    reason = line['lineStatuses'].first['reason']
    # Display the reason of the incident:
    puts reason
    
  end
  puts ""
end

#London’s lines status = https://api.tfl.gov.uk/line/mode/tube,overground,dlr,tflrail/status
