require 'rails_helper'
require 'faker'
require 'shoulda/matchers'

RSpec.describe User, type: :model do
  describe 'Check user validity' do
    subject do
      User.new(name: Faker::Name.unique.name,
               email: Faker::Internet.email,
               password: 'joy123', password_confirmation: 'joy123')
    end

    it 'should be valid with correct attributes' do
      expect(subject).to be_valid
    end

    it 'should not be valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not be valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  context 'associations' do
    it { should have_many(:clothes).dependent(:destroy).class_name('Cloth').with_foreign_key(:user_id) }
    it { should have_many(:groups).dependent(:destroy).class_name('Group').with_foreign_key(:user_id) }
  end

  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_confirmation_of(:password) }
  end

  context 'devise modules' do
    it { should validate_presence_of(:password_confirmation) }
  end
end
