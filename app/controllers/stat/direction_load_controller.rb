class Stat::DirectionLoadController < ApplicationController
  def index

    @conts = SipContext.all

  end





  def srv_get_conts

    @conts = SipContext.select('name').as_json

    render json: @conts


  end

  def srv_get_cont

    type_of = params[:type_of]
    cont = params[:cont]

    color = SipContext.where('name = ?', cont).first.color

    if type_of == 'day'

      today_start = Time.now.utc.at_beginning_of_day
      today_end = Time.now.utc.at_end_of_day

      count_str = ''

      while today_start <= today_end
        hour_start = today_start.at_beginning_of_hour
        hour_end = today_start.at_end_of_hour

        begin
          calls = AsteriskTimeLog.where('context = ? and calltime_point	>= ? and calltime_point <= ?', cont, hour_start, hour_end).group('calltime_point').size.max_by{|i| i[1].to_i}[1]
        rescue
          calls = 0
        end

        count_str += calls.to_s + ','

        today_start += 3600
      end

      @form_data = {
          cont: cont,
          color: color,
          count_str: count_str
      }

      render :day, layout: false

    end


    if type_of == 'year'

      year_start = Date.today.beginning_of_year + 0.seconds
      year_end = Date.today.end_of_year + 86399.seconds

      count_str = ''


      while year_start <= year_end

        month_start = year_start.beginning_of_month
        month_end = year_start.end_of_month


        begin
          calls = AsteriskTimeLog.where('context = ? and calltime_point	>= ? and calltime_point <= ?', cont, month_start, month_end).group('calltime_point').size.max_by{|i| i[1].to_i}[1]
        rescue
          calls = 0
        end

        count_str += calls.to_s + ','

        year_start += 1.month
      end

      @form_data = {
          cont: cont,
          color: color,
          count_str: count_str
      }

      render :year, layout: false

    end

  end




end
