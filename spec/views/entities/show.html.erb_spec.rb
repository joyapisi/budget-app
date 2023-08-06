require 'rails_helper'

RSpec.describe "entities/show", type: :view do
  before(:each) do
    assign(:entity, Entity.create!(
      name: "Name",
      user_id: 2,
      group_id: 3,
      author_id: 4,
      amount: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/9.99/)
  end
end
