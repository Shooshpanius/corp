class Cron::AsteriskParserController < ApplicationController

  def index

    logs = AsteriskLog.where('parsed  IS NULL')


    logs.each do |log_str|

      if log_str.src.to_s.length == 4 && log_str.dst.to_s.length ==4
        Call.create(
            calldate: log_str.calldate,
            src: log_str.src,
            dst: log_str.dst,
            duration: log_str.duration,
            billsec: log_str.billsec,
            disposition: log_str.disposition,
            uniqueid: log_str.uniqueid
        )

        AsteriskLog.update(
            log_str.id,
            parsed: true,
        )


      end



    end

    

  end


end