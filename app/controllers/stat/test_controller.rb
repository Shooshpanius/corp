class Stat::TestController < ApplicationController

  def index

    year_start = Date.today.beginning_of_year + 0.seconds
    year_end = Date.today.end_of_year + 86399.seconds

    @count_str = ''


    while year_start <= year_end

      month_start = year_start.beginning_of_month
      month_end = year_start.end_of_month


      begin
        calls = AsteriskTimeLog.where('context = ? and calltime_point	>= ? and calltime_point <= ?', cont, month_start, month_end).group('calltime_point').size.max_by{|i| i[1].to_i}[1]
      rescue
        calls = 0
      end

      @count_str += calls.to_s + ','

      year_start += 1.month
    end

    # @form_data = {
    #     cont: cont,
    #     color: color,
    #     count_str: count_str
    # }
    #
    # render :day, layout: false


  end

end
