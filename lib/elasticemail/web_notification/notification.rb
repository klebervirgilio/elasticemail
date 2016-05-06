module Elasticemail
  module WebNotification

    STATUSES = [
      SENT         = "Sent",
      OPENED       = 'Opened',
      CLICKED      = "Clicked",
      ERROR        = "Error",
      SUCCESS      = "Success",
      ABUSE_REPORT = "AbuseReport",
      UNSUBSCRIBED = "Unsubscribed"
    ].freeze

    CATEGORIES = [
      IGNORE                = "Ignore",
      SPAM                  = "SPam",
      BLACK_LISTED          = "BlackListed",
      NO_MAILBOX            = "NoMailbox",
      GREY_LISTED           = "GreyListed",
      THROTTLED             = "Throttled",
      TIMEOUT               = "Timeout",
      CONNECTIO_NPROBLEM    = "ConnectionProblem",
      SPF_PROBLEM           = "SPFProblem",
      ACCOUNT_PROBLEM       = "AccountProblem",
      DNS_PROBLEM           = "DNSProblem",
      WHITELISTING_PROBLEM  = "WhitelistingProblem",
      CODE_ERROR            = "CodeError",
      MANUAL_CANCEL         = "ManualCancel",
      CONNECTION_TERMINATED = "ConnectionTerminated",
      CONTENT_FILTER        = "ContentFilter",
      NOT_DELIVERED         = "NotDelivered",
      UNKNOWN               = "Unknown",
    ].freeze

    KEYS = %w[ to date subject status channel account category transaction ]

    class Notificaton
      def initialize(params)
        @hsh_params = params
      end

      STATUSES.each do |_status|
        _method = "#{_status.downcase}?"
        define_method _method do
          self.status == _status
        end unless instance_methods(false).include?(_method)
      end

      def respond_to?(meth)
        return true if KEYS.include?(meth.to_s) || KEYS.include?(meth)
        super
      end

      def method_missing(meth, *args, &blk)
        if KEYS.include?(meth.to_s)
         @hsh_params.fetch(meth.to_s) { @hsh_params.fetch(meth) }
        else
          super
        end
      end
    end
  end
end
