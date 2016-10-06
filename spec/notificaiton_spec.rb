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
      "date"=>"9/30/2016 5:34:21 PM",
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
    let(:notification) { Elasticemail::WebNotification::Notificaton.new(payload) }

    Elasticemail::WebNotification::KEYS.each do |_method|
      it "reads #{_method}" do
        expect(notification.public_send(_method)).to eq(payload[_method])
      end
    end

    it 'parses date' do
      expect(notification.date.day).to eq(30)
      expect(notification.date.month).to eq(9)
      expect(notification.date.year).to eq(2016)
      expect(notification.date.hour).to eq(17)
      expect(notification.date.minute).to eq(34)
      expect(notification.date.second).to eq(21)
    end
  end

  it 'exposes valid params' do
    expect(subject.to).to eq(1)
  end

  it 'does not expose invalid params' do
    expect { subject.not_a_param }.to raise_error(NoMethodError)
  end

  describe '.soft_bounce?' do
    Elasticemail::WebNotification::SOFT_BOUNCE.each do |bounce|
      it "#{bounce} is soft bounce" do
        notification = Elasticemail::WebNotification::Notificaton.new(category: bounce)
        expect(notification).to be_soft_bounce
      end
    end
    Elasticemail::WebNotification::HARD_BOUNCE.each do |bounce|
      it "#{bounce} is not soft bounce" do
        notification = Elasticemail::WebNotification::Notificaton.new(category: bounce)
        expect(notification).not_to be_soft_bounce
      end
    end
  end

  describe '.hard_bounce?' do
    Elasticemail::WebNotification::HARD_BOUNCE.each do |bounce|
      it "#{bounce} is hard bounce" do
        notification = Elasticemail::WebNotification::Notificaton.new(category: bounce)
        expect(notification).to be_hard_bounce
      end
    end
    Elasticemail::WebNotification::SOFT_BOUNCE.each do |bounce|
      it "#{bounce} is not hard bounce" do
        notification = Elasticemail::WebNotification::Notificaton.new(category: bounce)
        expect(notification).not_to be_hard_bounce
      end
    end
  end
end
