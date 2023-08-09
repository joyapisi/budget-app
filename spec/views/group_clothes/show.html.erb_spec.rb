require 'rails_helper'

RSpec.describe "group_clothes/show", type: :view do
  before(:each) do
    assign(:group_cloth, GroupCloth.create!(
      cloth: nil,
      group: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
