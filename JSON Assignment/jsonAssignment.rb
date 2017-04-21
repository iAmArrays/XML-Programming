require 'json'
require 'net/http'

# http://api.winnipegtransit.com/stops/10719/schedule?api-key=CzwPO9oR10VX6wku8WPB

# Working Stops
# 10064
# 10582
# 10545

API_KEY = "?api-key=CzwPO9oR10VX6wku8WPB"
API_URL = "http://api.winnipegtransit.com/"

def GetStopSchedule(stop_number)
    stop_schedule_source = "#{API_URL}stops/#{stop_number}/schedule.json#{API_KEY}&max-results-per-route=3"
    stop_schedule_response = Net::HTTP.get_response(URI.parse(stop_schedule_source))
    stop_schedule_data = stop_schedule_response.body
    stop_schedule_result = JSON.parse(stop_schedule_data)

    puts "The name of stop #{stop_number} is \"#{stop_schedule_result['stop-schedule']['stop']['name']}\". Latitude: #{stop_schedule_result['stop-schedule']['stop']['centre']['geographic']['latitude']}, Longitude: #{stop_schedule_result['stop-schedule']['stop']['centre']['geographic']['longitude']}"
    puts
    GetStopFeatures(stop_number)
    puts "Stop Schedule (estimated arriaval times):"
    puts
    stop_schedule_result['stop-schedule']['route-schedules']['route-schedule'].each do |route_schedule|
        print "- #{route_schedule['route']['name']}    "
        route_schedule['scheduled-stops']['scheduled-stop'].each do |scheduled_stop|
            print "#{scheduled_stop['times']['arrival']['estimated'].split('T')[1]}  "
        end
        puts
        puts
    end
end

def GetStopFeatures(stop_number)
    stop_features_source = "#{API_URL}stops/#{stop_number}/features.json#{API_KEY}"
    stop_features_response = Net::HTTP.get_response(URI.parse(stop_features_source))
    stop_features_data = stop_features_response.body
    stop_features_result = JSON.parse(stop_features_data)
    
    puts "Stop Features:"
    puts
    stop_features_result['stop-features']['stop-feature'].each do |feature|
        puts "- #{feature['count']} #{feature['name']}"
        puts
    end
end

def GetSystemTime
    system_time_source = "#{API_URL}time.json#{API_KEY}"
    system_time_response = Net::HTTP.get_response(URI.parse(system_time_source))
    system_time_data = system_time_response.body
    system_time_result = JSON.parse(system_time_data)
    puts
    puts "Winnipeg Transit System Time " + system_time_result['time'].split('T')[0] + " " + system_time_result['time'].split('T')[1]
    puts
end

GetSystemTime()

while true
    begin
        print "Enter stop number (DONE to quit):"
        stop_number = gets.chomp
        puts
        GetStopSchedule(stop_number)
    rescue
        if stop_number == "DONE"
            break
        else
            puts
            puts "An invalid stop number was entered, try again."
            puts
        end
    end
end

