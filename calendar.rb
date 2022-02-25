#今月のカレンダーを表示するプログラムを書いてみよう。（コマンドラインのプログラムとして作ろう）

require "date"
#曜日毎にスペース追加
def AddSpaceWday(today)
    today.wday.times{print "   "}
end

year = ARGV[0]||Date.today.year
month = ARGV[1]||Date.today.month
first_day = Date.new(year.to_i,month.to_i)
last_day = first_day.next_month(1).prev_day(1)
calendar = [*1..last_day.mday]
puts 
puts "      #{first_day.year}  #{first_day.strftime("%b")}      "
puts "====================="
puts "Su Mo Tu We Th Fr Sa"
calendar.each do |date|
    AddSpaceWday(first_day) if date == 1
    if first_day.next_day(date-1).saturday? == true or last_day.mday == date
        puts date < 10 ? " #{date}" : date
    else
        print date < 10 ? " #{date} " : "#{date} " if last_day.mday != date
        #puts date < 10 ? " #{date} " : "#{date} " if last_day.mday == date
        #print date < 10 ? " #{date} " : "#{date} "
    end
end
puts "====================="
puts 
