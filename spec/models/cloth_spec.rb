require 'rails_helper'
require 'faker'

RSpec.describe Cloth, type: :model do
  before(:each) do
    @joy = User.create!(name: Faker::Name.unique.name,
                        email: Faker::Internet.email,
                        password: 'joy123', password_confirmation: 'joy123')

    @group = Group.create!(name: 'Tops', icon: 'some icon', user: @joy)
  end

  subject { Cloth.new(name: 'Shirt', amount: 25, user: @joy, group: @group) }

  before { subject.save }

  describe 'Check validity of Cloths' do
    it 'should check validity of name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check validity of amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'should check validity to be saved' do
      expect(subject).to be_valid
    end
  end
end
