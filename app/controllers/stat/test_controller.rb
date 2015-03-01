class Stat::TestController < ApplicationController

  def index

    @call = Call.all[5]

    @test = ''

    call_start = @call.calldate - 10
    call_end = @call.calldate_end + 10


    while call_start <= call_end do

      sec = call_start.to_a[0].to_s

      if sec[-1..-1] == '0'
        @test = @test + ' ' + sec[-1..-1] + ' ' + call_start.to_s + ' | '
      end


      call_start = call_start + 1
    end

  end

end
