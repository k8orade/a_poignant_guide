require 'rails_helper'

RSpec.describe LearningMaterial, type: :model do
  before(:each) do
    @valid_material = LearningMaterial.new(name: 'Book',
                                           source: 'books.com/book',
                                           description: 'very good book',
                                           duration: 300,
                                           difficulty: 'beginner')
  end

  it 'can be valid' do
    expect(@valid_material.valid?).to be_truthy
  end

  context 'name' do
    it 'is required' do
      @valid_material.name = nil
      expect(@valid_material.valid?).to be_falsey
    end

    it 'is invalid when the name is not unique' do
      material = LearningMaterial.create(name: 'Book',
                                         source: 'books.com/book',
                                         description: 'different book',
                                         duration: 180,
                                         difficulty: 'intermediate')
      expect(@valid_material.valid?).to be_falsey
    end

    it 'is valid when the name is unique to the source' do
      material = LearningMaterial.create(name: 'Book',
                                         source: 'otherbooks.com/book',
                                         description: 'different book',
                                         duration: 180,
                                         difficulty: 'intermediate')
      expect(@valid_material.valid?).to be_truthy
    end
  end

  context 'difficulty' do
    it 'is required' do
      @valid_material.difficulty = nil
      expect(@valid_material.valid?).to be_falsey
    end

    it 'is invalid when not one of the whitelisted difficulties' do
      @valid_material.difficulty = 'random'
      expect(@valid_material.valid?).to be_falsey
    end
  end
end
