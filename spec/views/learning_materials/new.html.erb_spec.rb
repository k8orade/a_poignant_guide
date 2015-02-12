require 'rails_helper'

RSpec.describe "learning_materials/new", type: :view do
  before(:each) do
    assign(:learning_material, LearningMaterial.new(
      :name => "MyString",
      :source => "MyString",
      :description => "MyText",
      :duration => 1,
      :difficulty => "MyString"
    ))
  end

  it "renders new learning_material form" do
    render

    assert_select "form[action=?][method=?]", learning_materials_path, "post" do

      assert_select "input#learning_material_name[name=?]", "learning_material[name]"

      assert_select "input#learning_material_source[name=?]", "learning_material[source]"

      assert_select "textarea#learning_material_description[name=?]", "learning_material[description]"

      assert_select "input#learning_material_duration[name=?]", "learning_material[duration]"

      assert_select "input#learning_material_difficulty[name=?]", "learning_material[difficulty]"
    end
  end
end
