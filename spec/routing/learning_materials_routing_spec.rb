require "rails_helper"

RSpec.describe LearningMaterialsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/learning_materials").to route_to("learning_materials#index")
    end

    it "routes to #new" do
      expect(:get => "/learning_materials/new").to route_to("learning_materials#new")
    end

    it "routes to #show" do
      expect(:get => "/learning_materials/1").to route_to("learning_materials#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/learning_materials/1/edit").to route_to("learning_materials#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/learning_materials").to route_to("learning_materials#create")
    end

    it "routes to #update" do
      expect(:put => "/learning_materials/1").to route_to("learning_materials#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/learning_materials/1").to route_to("learning_materials#destroy", :id => "1")
    end

  end
end
