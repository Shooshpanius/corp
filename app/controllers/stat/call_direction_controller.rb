class Stat::CallDirectionController < ApplicationController
  def index
  end

  def srv_get_cell_k



    data = {
        labels: ["January", "February", "March", "April", "May", "June", "July", ],
        datasets: [
            {
                label: "My First dataset",
                fillColor: "rgba(220,220,220,0.5)",
                strokeColor: "rgba(220,220,220,0.8)",
                highlightFill: "rgba(220,220,220,0.75)",
                highlightStroke: "rgba(220,220,220,1)",
                data: [65, 59, 80, 81, 56, 55, 40]
            },
            {
                label: "My Second dataset",
                fillColor: "rgba(151,187,205,0.5)",
                strokeColor: "rgba(151,187,205,0.8)",
                highlightFill: "rgba(151,187,205,0.75)",
                highlightStroke: "rgba(151,187,205,1)",
                data: [28, 48, 40, 19, 86, 27, 90]
            },
        ]
    }

    respond_to do |format|
      format.json { render :json => data}
    end

  end



  def srv_get_cell_test

    date_from = Date.today.prev_day(7)
    date_to = Date.today.next_day(1)

    @cont = Call.select('calldate, descr, context, sum(duration) as total_duration, sum(billsec) as total_billsec').where('descr = ? and DATE(calldate) >= ? and DATE(calldate) <= ?', 'cell', date_from, date_to).group('context')

    respond_to do |format|
      format.json
    end

    end


end
