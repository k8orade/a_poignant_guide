require 'rails_helper'

RSpec.describe "learning_materials/edit", type: :view do
  before(:each) do
    @learning_material = assign(:learning_material, LearningMaterial.create!(
      :name => "MyString",
      :source => "MyString",
      :description => "MyText",
      :duration => 1,
      :difficulty => "MyString"
    ))
  end

  it "renders the edit learning_material form" do
    render

    assert_select "form[action=?][method=?]", learning_material_path(@learning_material), "post" do

      assert_select "input#learning_material_name[name=?]", "learning_material[name]"

      assert_select "input#learning_material_source[name=?]", "learning_material[source]"

      assert_select "textarea#learning_material_description[name=?]", "learning_material[description]"

      assert_select "input#learning_material_duration[name=?]", "learning_material[duration]"

      assert_select "input#learning_material_difficulty[name=?]", "learning_material[difficulty]"
    end
  end
end
