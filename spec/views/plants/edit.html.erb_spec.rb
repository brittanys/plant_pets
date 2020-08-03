require 'rails_helper'

RSpec.describe "plants/edit", type: :view do
  before(:each) do
    @plant = assign(:plant, Plant.create!(
      name: "MyString",
      growth: 1
    ))
  end

  it "renders the edit plant form" do
    render

    assert_select "form[action=?][method=?]", plant_path(@plant), "post" do

      assert_select "input[name=?]", "plant[name]"

      assert_select "input[name=?]", "plant[growth]"
    end
  end
end
