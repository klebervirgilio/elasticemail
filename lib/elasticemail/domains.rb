module Elasticemail
  class Domains
    def self.add
      domain = Elasticemail::Domain::AddDomain.new
      yield domain
      domain.perform
    end

    def self.verify_spf
      domain = Elasticemail::Domain::VerifySpf.new
      yield domain
      domain.perform
    end

    def self.verify_dkim
      domain = Elasticemail::Domain::VerifyDkim.new
      yield domain
      domain.perform
    end
  end
end
