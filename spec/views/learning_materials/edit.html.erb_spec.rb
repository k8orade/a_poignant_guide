require 'rails_helper'

RSpec.describe "materials/edit", type: :view do
  before(:each) do
    @material = assign(:material, Material.create!(
      :name => "MyString",
      :source => "MyString",
      :description => "MyText",
      :duration => 1,
      :difficulty => "MyString"
    ))
  end

  it "renders the edit material form" do
    render

    assert_select "form[action=?][method=?]", material_path(@material), "post" do

      assert_select "input#material_name[name=?]", "material[name]"

      assert_select "input#material_source[name=?]", "material[source]"

      assert_select "textarea#material_description[name=?]", "material[description]"

      assert_select "input#material_duration[name=?]", "material[duration]"

      assert_select "input#material_difficulty[name=?]", "material[difficulty]"
    end
  end
end
