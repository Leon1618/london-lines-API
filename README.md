# london-lines-API
London’s lines status API

(LE WAGON LIVE SESSION)

Let’s create a program that gives us the status of London transport lines!

First, have a look at the URL we are calling with our program:
London’s lines status

On this page, Transport For London is giving us plenty of information in real-time regarding the status of its tube and overground lines!

Our program on the right is telling the computer to go on that URL (👉 on line 6 of our code here), read each lineStatuses (on line 9) and their name (on line 11) and display this information to us (on line 13).

If there is a disruption, we are asking our code to read the reason of this incident (on line 16 here) and display it to us on line 18.

Our code doesn’t work yet, so we need you to finish it! 🚀

Your turn

Let’s break it down in three steps:

We need to find the name of each line and store it in a variable line_name on line 11. To do so, open the URL again and find which key stores this information. You can then access this information by writing line['replace_this_with_key'] and storing this in a variable. Check the solution below if you need:
Details
Now let’s display each line name and its status on line 13, to see something like ・ Good Service on the Bakerloo. Check how below if you are unsure 👇
Details
Now last step, if a line has an incident to report, we want to display the reason for it. We have already stored this information in the variable reason on line 16. Now you need to display it on line 18 to see something like:
The reason is: ...
Pssst: Remember interpolation? Use double quotes and inject your variable name using curly brackets:

"Good morning, #{first_name}!"
Good luck, and click on Run! to see it in action when you are done! 🍀

👉 Click below to check the solution when you are done:

Details
  require 'open-uri'
  require 'json'

  ENDPOINT = 'https://api.tfl.gov.uk/line/mode/tube,overground,dlr,tflrail/status'

  json_data = URI.open(ENDPOINT).read

  JSON.parse(json_data).each do |line|
    line_name = line['name']
    status = line['lineStatuses'].first['statusSeverityDescription']
    puts "・ #{status} on the #{line_name}"

    if line['lineStatuses'].first['reason']
      reason = line['lineStatuses'].first['reason']

      puts "The reason is: #{reason}"
    end
    puts ""
  end
