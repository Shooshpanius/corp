class Cron::AsteriskParserController < ApplicationController

  def index

    logs = AsteriskLog.where('parsed  IS NULL')
    #logs = AsteriskLog.all

    logs.each do |log_str|

      # XXXX на XXXX (локальный)
      #
      if log_str.src.to_s.length == 4 &&
          log_str.dst.to_s.length ==4 &&
          log_str.lastdata.to_s.scan(/SIP\/\d{4}/)[0].to_s.length == 8

        Call.create(
            calldate: log_str.calldate,
            src: log_str.src,
            dst: log_str.dst,
            duration: log_str.duration,
            billsec: log_str.billsec,
            disposition: log_str.disposition,
            uniqueid: log_str.uniqueid,
            direction: 'o',
            context: 'local',
            descr: 'local',
            calldate_end: log_str.calldate + log_str.duration
        )

        AsteriskLog.update(
            log_str.id,
            parsed: true,
        )
      end

      # XXXX на XXXX c назначением XXXXXXXXXXX (локальный, ушедший на внешний)
      #
      if log_str.src.to_s.length == 4 &&
          log_str.dst.to_s.length ==4 &&
          log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s.length == 11

        dst = log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s
        descr = call_descr(dst)

        Call.create(
            calldate: log_str.calldate,
            src: log_str.src,
            dst: dst,
            duration: log_str.duration,
            billsec: log_str.billsec,
            disposition: log_str.disposition,
            uniqueid: log_str.uniqueid,
            direction: 'o',
            context: log_str.lastdata.to_s.scan(/SIP\/[A-Za-z_-]+\//)[0].to_s[4..-2],
            descr: descr,
            calldate_end: log_str.calldate + log_str.duration
        )

        AsteriskLog.update(
            log_str.id,
            parsed: true,
        )
      end

      # XXXX на XXXXXXXXXXX (на внешний)
      #
      if log_str.src.to_s.length == 4 &&
          log_str.dst.to_s.length ==11 &&
          log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s.length == 11

        dst = log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s
        descr = call_descr(dst)

        Call.create(
            calldate: log_str.calldate,
            src: log_str.src,
            dst: dst,
            duration: log_str.duration,
            billsec: log_str.billsec,
            disposition: log_str.disposition,
            uniqueid: log_str.uniqueid,
            direction: 'o',
            context: log_str.lastdata.to_s.scan(/SIP\/[A-Za-z_-]+\//)[0].to_s[4..-2],
            descr: descr,
            calldate_end: log_str.calldate + log_str.duration
        )

        AsteriskLog.update(
            log_str.id,
            parsed: true,
        )
      end

      # XXXX на XXXXX (на город, через SIP)
      #
      if log_str.src.to_s.length == 4 &&
          log_str.dst.to_s.length ==5 &&
          log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s.length == 11

        dst = log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s
        descr = 'city'

        Call.create(
            calldate: log_str.calldate,
            src: log_str.src,
            dst: dst,
            duration: log_str.duration,
            billsec: log_str.billsec,
            disposition: log_str.disposition,
            uniqueid: log_str.uniqueid,
            direction: 'o',
            context: log_str.lastdata.to_s.scan(/SIP\/[A-Za-z_-]+\//)[0].to_s[4..-2],
            descr: descr,
            calldate_end: log_str.calldate + log_str.duration
        )

        AsteriskLog.update(
            log_str.id,
            parsed: true,
        )
      end


    end

  end



  private
  def call_descr(dst)

    descr = '-'

    if dst[0] == '8'
      if dst[1] == '9'
        if CorpNumber.where('number = ? and type_n = ?', dst[1..-1], 'c').size > 0
          descr = 'corp'
        else
          descr = 'cell'
        end
      elsif dst[0,6] == '881836'
        descr = 'city'
      else
        descr = 'intercity'
      end
    end

    return descr
  end


end
