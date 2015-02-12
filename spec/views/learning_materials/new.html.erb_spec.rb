require 'rails_helper'

RSpec.describe "materials/new", type: :view do
  before(:each) do
    assign(:material, Material.new(
      :name => "MyString",
      :source => "MyString",
      :description => "MyText",
      :duration => 1,
      :difficulty => "MyString"
    ))
  end

  it "renders new material form" do
    render

    assert_select "form[action=?][method=?]", materials_path, "post" do

      assert_select "input#material_name[name=?]", "material[name]"

      assert_select "input#material_source[name=?]", "material[source]"

      assert_select "textarea#material_description[name=?]", "material[description]"

      assert_select "input#material_duration[name=?]", "material[duration]"

      assert_select "input#material_difficulty[name=?]", "material[difficulty]"
    end
  end
end
