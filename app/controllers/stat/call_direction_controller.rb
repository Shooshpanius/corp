class Stat::CallDirectionController < ApplicationController
  def index
  end

  def srv_get_cell_k

    date_from = Date.today.prev_day(7)
    date_to = Date.today.next_day(1)

    @cont = Call.select('calldate, descr, context, sum(duration) as total_duration, sum(billsec) as total_billsec').where('descr = ? and DATE(calldate) >= ? and DATE(calldate) <= ?', 'cell', date_from, date_to).group('context')

    respond_to do |format|
      format.json
    end

    end


end
