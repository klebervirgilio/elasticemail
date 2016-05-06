module Elasticemail
  class Domains
    def self.add(domain=nil, apy_key=nil)
      domain = Elasticemail::Domain::AddDomain.new(apy_key, domain)
      yield domain if block_given?
      domain.perform
    end

    def self.verify_spf(domain=nil, apy_key=nil)
      domain = Elasticemail::Domain::VerifySpf.new(apy_key, domain)
      yield domain if block_given?
      domain.perform
    end

    def self.verify_dkim(domain=nil, apy_key=nil)
      domain = Elasticemail::Domain::VerifyDkim.new(apy_key, domain)
      yield domain if block_given?
      domain.perform
    end

    def self.verify_mx(domain=nil, apy_key=nil)
      domain = Elasticemail::Domain::VerifyMx.new(apy_key, domain)
      yield domain if block_given?
      domain.perform
    end
  end
end
