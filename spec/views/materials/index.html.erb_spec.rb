require 'rails_helper'

RSpec.describe "materials/index", type: :view do
  before(:each) do
    assign(:materials, [
      Material.create!(),
      Material.create!()
    ])
  end

  it "renders a list of materials" do
    render
  end
end
