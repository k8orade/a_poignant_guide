require 'rails_helper'

RSpec.describe "LearningMaterials", type: :request do
  describe "GET /learning_materials" do
    it "works! (now write some real specs)" do
      get learning_materials_path
      expect(response).to have_http_status(200)
    end
  end
end
