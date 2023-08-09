require 'rails_helper'

RSpec.describe "group_clothes/edit", type: :view do
  let(:group_cloth) {
    GroupCloth.create!(
      cloth: nil,
      group: nil
    )
  }

  before(:each) do
    assign(:group_cloth, group_cloth)
  end

  it "renders the edit group_cloth form" do
    render

    assert_select "form[action=?][method=?]", group_cloth_path(group_cloth), "post" do

      assert_select "input[name=?]", "group_cloth[cloth_id]"

      assert_select "input[name=?]", "group_cloth[group_id]"
    end
  end
end
