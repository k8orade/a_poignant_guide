require 'rails_helper'

RSpec.describe "learning_materials/index", type: :view do
  before(:each) do
    assign(:learning_materials, [
      LearningMaterial.create!(
        :name => "Name",
        :source => "Source",
        :description => "MyText",
        :duration => 1,
        :difficulty => "Difficulty"
      ),
      LearningMaterial.create!(
        :name => "Name",
        :source => "Source",
        :description => "MyText",
        :duration => 1,
        :difficulty => "Difficulty"
      )
    ])
  end

  it "renders a list of learning_materials" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Source".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Difficulty".to_s, :count => 2
  end
end
