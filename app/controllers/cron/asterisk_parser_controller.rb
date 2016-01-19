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

        new_call = Call.create(
            calldate: log_str.calldate,
            src: log_str.src,
            dst: log_str.dst,
            duration: log_str.duration,
            billsec: log_str.billsec,
            disposition: log_str.disposition,
            uniqueid: log_str.uniqueid,
            direction: 'o',
            context: 'local-'+log_str.src[0],
            descr: 'local',
            calldate_end: log_str.calldate + log_str.duration
        )

        AsteriskLog.update(
            log_str.id,
            parsed: true,
        )

        # call_to_adv_log(new_call)

      end

      # XXX-TD на XXXX (локальный)
      #
      if log_str.src.to_s.length == 3 &&
          log_str.dst.to_s.length ==4 &&
          log_str.lastdata.to_s.scan(/SIP\/\d{4}/)[0].to_s.length == 8

        new_call = Call.create(
            calldate: log_str.calldate,
            src: log_str.src,
            dst: log_str.dst,
            duration: log_str.duration,
            billsec: log_str.billsec,
            disposition: log_str.disposition,
            uniqueid: log_str.uniqueid,
            direction: 'o',
            context: 'local-td',
            descr: 'local',
            calldate_end: log_str.calldate + log_str.duration
        )

        AsteriskLog.update(
            log_str.id,
            parsed: true,
        )

        # call_to_adv_log(new_call)

      end

      # XXX-TD на XXXX (локальный)
      #
      if log_str.src.to_s.length == 3 &&
          log_str.dst.to_s.length ==4 &&
          log_str.lastdata.to_s.scan(/IAX2\/td/)[0].to_s.length == 7

        new_call = Call.create(
            calldate: log_str.calldate,
            src: log_str.src,
            dst: log_str.dst,
            duration: log_str.duration,
            billsec: log_str.billsec,
            disposition: log_str.disposition,
            uniqueid: log_str.uniqueid,
            direction: 'o',
            context: 'local-td_l',
            descr: 'local',
            calldate_end: log_str.calldate + log_str.duration
        )

        AsteriskLog.update(
            log_str.id,
            parsed: true,
        )

        # call_to_adv_log(new_call)

      end

      # XXXX на XXX-TD (локальный)
      #
      if log_str.src.to_s.length == 4&&
          log_str.dst.to_s.length ==3 &&
          log_str.lastdata.to_s.scan(/SIP\/\d{3}/)[0].to_s.length == 7

        new_call = Call.create(
            calldate: log_str.calldate,
            src: log_str.src,
            dst: log_str.dst,
            duration: log_str.duration,
            billsec: log_str.billsec,
            disposition: log_str.disposition,
            uniqueid: log_str.uniqueid,
            direction: 'o',
            context: 'local-'+log_str.src[0],
            descr: 'local',
            calldate_end: log_str.calldate + log_str.duration
        )

        AsteriskLog.update(
            log_str.id,
            parsed: true,
        )

        # call_to_adv_log(new_call)

      end


      # XXXX на XXX-TD (локальный)
      #
      if log_str.src.to_s.length == 4&&
          log_str.dst.to_s.length ==3 &&
          log_str.lastdata.to_s.scan(/IAX2\/vlk/)[0].to_s.length == 8

        new_call = Call.create(
            calldate: log_str.calldate,
            src: log_str.src,
            dst: log_str.dst,
            duration: log_str.duration,
            billsec: log_str.billsec,
            disposition: log_str.disposition,
            uniqueid: log_str.uniqueid,
            direction: 'o',
            context: 'local-'+log_str.src[0]+'_l',
            descr: 'local',
            calldate_end: log_str.calldate + log_str.duration
        )

        AsteriskLog.update(
            log_str.id,
            parsed: true,
        )

        # call_to_adv_log(new_call)

      end

      # XXX-TD на XXX-TD (локальный)
      #
      if log_str.src.to_s.length == 3 &&
          log_str.dst.to_s.length ==3 &&
          log_str.lastdata.to_s.scan(/SIP\/\d{3}/)[0].to_s.length == 7

        new_call = Call.create(
            calldate: log_str.calldate,
            src: log_str.src,
            dst: log_str.dst,
            duration: log_str.duration,
            billsec: log_str.billsec,
            disposition: log_str.disposition,
            uniqueid: log_str.uniqueid,
            direction: 'o',
            context: 'local-td',
            descr: 'local',
            calldate_end: log_str.calldate + log_str.duration
        )

        AsteriskLog.update(
            log_str.id,
            parsed: true,
        )

        # call_to_adv_log(new_call)

      end







      # XXXX на XXXX c назначением XXXXXXXXXXX (локальный, ушедший на внешний)
      #
      if log_str.src.to_s.length == 4 &&
          log_str.dst.to_s.length ==4 &&
          log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s.length == 11

        dst = log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s
        descr = call_descr(dst)

        new_call = Call.create(
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

        # call_to_adv_log(new_call)

      end


      # XXX-TD на XXXX c назначением XXXXXXXXXXX (локальный, ушедший на внешний)
      #
      if log_str.src.to_s.length == 3 &&
          log_str.dst.to_s.length ==4 &&
          log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s.length == 11

        dst = log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s
        descr = call_descr(dst)

        new_call = Call.create(
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

        # call_to_adv_log(new_call)

      end


      # XXXX на XXX-TD c назначением XXXXXXXXXXX (локальный, ушедший на внешний)
      #
      if log_str.src.to_s.length == 4 &&
          log_str.dst.to_s.length ==3 &&
          log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s.length == 11

        dst = log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s
        descr = call_descr(dst)

        new_call = Call.create(
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

        # call_to_adv_log(new_call)

      end















      # XXXX на XXXXXXXXXXX (на внешний)
      #
      if log_str.src.to_s.length == 4 &&
          log_str.dst.to_s.length ==11 &&
          log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s.length == 11

        dst = log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s
        descr = call_descr(dst)

        new_call = Call.create(
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

        # call_to_adv_log(new_call)

      end


      # XXX-TD на XXXXXXXXXXX (на внешний)
      #
      if log_str.src.to_s.length == 3 &&
          log_str.dst.to_s.length ==11 &&
          log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s.length == 11

        dst = log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s
        descr = call_descr(dst)

        new_call = Call.create(
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

        # call_to_adv_log(new_call)

      end






      # XXXX на XXXXX (на город, через SIP)
      #
      if log_str.src.to_s.length == 4 &&
          log_str.dst.to_s.length ==5 &&
          log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s.length == 11

        dst = log_str.lastdata.to_s.scan(/\d{11}/)[0].to_s
        descr = 'city'

        new_call = Call.create(
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

        # call_to_adv_log(new_call)

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


  private
  def call_to_adv_log(call)

    call = call

    call_start = call.calldate - 10
    call_end = call.calldate_end + 10

    call_start_a = call_start.to_a
    call_start_a[0] = (call_start.to_a[0] / 10).to_i*10
    call_start = Time.utc *call_start_a

    while call_start <= call_end do


      AsteriskTimeLog.create(
          callid: call.id,
          uniqueid: call.uniqueid,
          calltime_point: call_start,
          context: call.context,
          descr: call.descr
      )


      call_start = call_start + 10
    end


    return 'descr'
  end

end
