require 'spec_helper'

describe Elasticemail::WebNotification::Notificaton do
  subject {
    Elasticemail::WebNotification::Notificaton.new(to: 1, not_a_param: 2)
  }

  it 'exposes valid params' do
    expect(subject.to).to eq(1)
  end

  it 'does not expose invalid params' do
    expect { subject.not_a_param }.to raise_error(NoMethodError)
  end
end
