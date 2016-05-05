module Elasticemail
  class Domains
    def self.add
      domain = Elasticemail::Domain::AddDomain.new
      yield domain
      domain.perform
    end

    def self.verify_spf(domain=nil)
      domain = Elasticemail::Domain::VerifySpf.new(nil, domain)
      yield domain if block_given?
      domain.perform
    end

    def self.verify_dkim(domain=nil)
      domain = Elasticemail::Domain::VerifyDkim.new(nil, domain)
      yield domain if block_given?
      domain.perform
    end

    def self.verify_mx(domain=nil)
      domain = Elasticemail::Domain::VerifyMx.new(nil, domain)
      yield domain if block_given?
      domain.perform
    end
  end
end
