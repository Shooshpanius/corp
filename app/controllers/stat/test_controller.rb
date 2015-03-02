class Stat::TestController < ApplicationController

  def index

    @call = Call.all[5]

    @test = ' '

    call_start = @call.calldate - 10
    call_end = @call.calldate_end + 10

    call_start_a = call_start.to_a
    call_start_a[0] = (call_start.to_a[0] / 10).to_i*10
    call_start = Time.utc *call_start_a



    @call1 = call_start
    @call2 = call_end


    while call_start <= call_end do

      sec = call_start.to_a[0].to_s


      @test  = @test + ' ' + sec + ' ' + call_start.to_s

      call_start = call_start + 10
    end

  end

end
