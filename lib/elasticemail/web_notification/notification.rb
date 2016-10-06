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

    # http://api.elasticemail.com/public/help#classes_BouncedCategorySummary
    CATEGORIES = [
      ACCOUNT_PROBLEM       = "AccountProblem",
      BLACK_LISTED          = "BlackListed",
      CODE_ERROR            = "CodeError",
      CONNECTION_PROBLEM    = "ConnectionProblem",
      CONNECTION_TERMINATED = "ConnectionTerminated",
      CONTENT_FILTER        = "ContentFilter",
      DNS_PROBLEM           = "DnsProblem",
      GREY_LISTED           = "GreyListed",
      IGNORE                = "Ignore",
      MANUAL_CANCEL         = "ManualCancel",
      NO_MAILBOX            = "NoMailbox",
      NOT_DELIVERED         = "NotDelivered",
      SPAM                  = "Spam",
      SPF_PROBLEM           = "SpfProblem",
      THROTTLED             = "Throttled",
      TIMEOUT               = "Timeout",
      UNKNOWN               = "Unknown",
      WHITELISTING_PROBLEM  = "WhitelistingProblem",
    ].freeze

    # https://elasticemail.com/support/user-interface/activity/bounced-category-filters
    DELIVERY_ERROR_CATEGORIES = [
      HARD_BOUNCE = [
        NO_MAILBOX,
        ACCOUNT_PROBLEM
      ],
      SOFT_BOUNCE = [
        CODE_ERROR,
        CONNECTION_PROBLEM,
        CONNECTION_TERMINATED,
        DNS_PROBLEM,
        GREY_LISTED,
        "IpReputationIssue", # not sure about that one
        MANUAL_CANCEL,
        NOT_DELIVERED,
        SPAM,
        SPF_PROBLEM,
        THROTTLED,
        TIMEOUT,
        UNKNOWN,
        WHITELISTING_PROBLEM,
      ]
    ]

    KEYS = %w[ to subject status channel account category transaction target messageid ]

    class Notificaton
      def initialize(params)
        @hsh_params = params
      end

      def date
        @date ||= DateTime.strptime(@hsh_params['date'], DATE_FORMAT)
      end

      def soft_bounce?
        @soft_bounce ||= error? && SOFT_BOUNCE.include?(category)
      end

      def hard_bounce?
        @hard_bounce ||= error? && HARD_BOUNCE.include?(category)
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
