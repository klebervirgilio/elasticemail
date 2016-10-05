module Elasticemail
  module WebNotification

    DATE_FORMAT = '%m/%d/%Y %H:%M:%S %p'.freeze

    STATUSES = {
      SENT         = "Sent"         => :sent,
      OPENED       = 'Opened'       => :opened,
      CLICKED      = "Clicked"      => :clicked,
      ERROR        = "Error"        => :error,
      SUCCESS      = "Success"      => :success,
      ABUSE_REPORT = "AbuseReport"  => :abuse_report,
      UNSUBSCRIBED = "Unsubscribed" => :unsubscribed
    }.freeze

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

    KEYS = %w[ to subject status channel account category transaction target messageid ]

    class Notificaton
      def initialize(params)
        @hsh_params = params
      end

      def date
        DateTime.strptime(@hsh_params['date'], DATE_FORMAT)
      end

      STATUSES.each do |_status, _method|
        define_method "#{_method}?" do
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
