require 'rails_helper'

RSpec.describe "learning_materials/show", type: :view do
  before(:each) do
    @learning_material = assign(:learning_material, LearningMaterial.create!(
      :name => "Name",
      :source => "Source",
      :description => "MyText",
      :duration => 1,
      :difficulty => "Difficulty"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Source/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Difficulty/)
  end
end
