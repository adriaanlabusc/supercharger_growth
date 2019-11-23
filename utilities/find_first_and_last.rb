require 'json'
require 'date'

def find_first_and_last superchargers
  first_date = nil
  last_date = nil
  second_last_date = nil
  nil_count = 0
  superchargers.each do |sc|
    if sc["dateOpened"].nil?
      nil_count += 1
      next
    end
    if first_date.nil? || Date.strptime(sc["dateOpened"], '%Y-%m-%d') < first_date
      first_date = Date.strptime(sc["dateOpened"], '%Y-%m-%d')
    end
    if last_date.nil? || Date.strptime(sc["dateOpened"], '%Y-%m-%d') > last_date
      second_last_date = last_date
      last_date = Date.strptime(sc["dateOpened"], '%Y-%m-%d')
    end
  end
  [first_date,second_last_date, last_date, "nil_count: #{nil_count}", "total_num: #{superchargers.size}"]
end

input_file_path = File.dirname(__FILE__) + "/../superchargers.json"
input = JSON.parse(File.read(input_file_path))

puts find_first_and_last(input).inspect

# output:
# [#<Date: 2012-11-19 ((2456251j,0s,0n),+0s,2299161j)>, #<Date: 2019-11-09 ((2458797j,0s,0n),+0s,2299161j)>, #<Date: 2918-11-05 ((2787146j,0s,0n),+0s,2299161j)>]