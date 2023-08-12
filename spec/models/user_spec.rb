require 'rails_helper'
require 'faker'
require 'shoulda/matchers'

RSpec.describe User, type: :model do
  let(:unique_name) { Faker::Name.unique.name }
  let(:valid_attributes) do
    {
      name: unique_name,
      email: Faker::Internet.email,
      password: 'joy123',
      password_confirmation: 'joy123'
    }
  end

  describe 'Check user validity' do
    subject { User.new(valid_attributes) }

    it 'should be valid with correct attributes' do
      expect(subject).to be_valid
    end

    it 'should not be valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  context 'devise modules' do
    subject { User.new(valid_attributes) }

    it { should validate_confirmation_of(:password) }
  end
end
