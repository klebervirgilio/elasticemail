require 'spec_helper'

describe Elasticemail::WebNotification::Notificaton do
  subject {
    Elasticemail::WebNotification::Notificaton.new(to: 1, not_a_param: 2)
  }

  let(:payload) do
    {
      "transaction"=>"transaction",
      "to"=>"sales@eample.net",
      "from"=>"demo@eample.net",
      "date"=>"9/30/2016 5:34:21 AM",
      "status"=>"Clicked",
      "channel"=>"channel",
      "account"=>"elastic@eample.net",
      "category"=>"Unknown",
      "target"=>"https://mysite.com",
      "subject"=>"Testing",
      "messageid"=>"messageid"
    }
  end

  describe '.statuses?' do
    Elasticemail::WebNotification::STATUSES.each do |status, _method|
      subject { Elasticemail::WebNotification::Notificaton.new(status: status) }
      it { is_expected.to be_respond_to("#{_method}?") }
    end
  end

  describe 'payload' do
    Elasticemail::WebNotification::KEYS.each do |_method|
      it "reads #{_method}" do
        notification = Elasticemail::WebNotification::Notificaton.new(payload)
        expect(notification.public_send(_method)).to eq(payload[_method])
      end
    end
  end

  it 'exposes valid params' do
    expect(subject.to).to eq(1)
  end

  it 'does not expose invalid params' do
    expect { subject.not_a_param }.to raise_error(NoMethodError)
  end
end
