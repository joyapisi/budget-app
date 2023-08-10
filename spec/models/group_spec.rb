require 'rails_helper'
require 'faker'

RSpec.describe Group, type: :model do
  before(:each) do
    @joy = User.create!(name: Faker::Name.unique.name,
                         email: Faker::Internet.email,
                         password: 'joy123', password_confirmation: 'joy123')
  end

  subject { Group.new(name: 'Tops', icon: 'some icon', user: @joy) }

  before { subject.save }

  describe 'Check validity of Model' do
    it 'should check validity of name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check validity of icon' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'should check validity to be saved' do
      expect(subject).to be_valid
    end
  end
end
