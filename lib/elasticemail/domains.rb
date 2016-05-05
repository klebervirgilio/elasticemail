module Elasticemail
  class Domains
    def self.add
      domain = Elasticemail::Domain::AddDomain.new
      yield domain
      domain.perform
    end
  end
end
