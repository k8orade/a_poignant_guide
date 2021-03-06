require 'rails_helper'

RSpec.describe Material, type: :model do
  before(:each) do
    @valid_material = Material.new(name: 'Book',
                                   source: 'https://books.com/book',
                                   description: 'very good book',
                                   duration: 300,
                                   difficulty: 'beginner')
  end

  it 'can be valid' do
    expect(@valid_material.valid?).to be_truthy
  end

  it 'orders by name and source by default' do
    a = @valid_material.dup
    a.name = 'Antelope'
    a.save
    b = @valid_material.dup
    b.source = 'https://zooks.com/book'
    b.save
    @valid_material.save

    expect(Material.all).to eq [a, @valid_material, b]
  end

  context 'name' do
    it 'is required' do
      @valid_material.name = nil
      expect(@valid_material.valid?).to be_falsey
    end

    it 'is invalid when the name is not unique' do
      material = Material.create(name: 'Book',
                                 source: 'https://books.com/book',
                                 description: 'different book',
                                 duration: 180,
                                 difficulty: 'intermediate')
      expect(@valid_material.valid?).to be_falsey
    end

    it 'is valid when the name is unique to the source' do
      material = Material.create(name: 'Book',
                                 source: 'https://otherbooks.com/book',
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

  context 'source' do
    it 'is required' do
      @valid_material.source = nil
      expect(@valid_material.valid?).to be_falsey
    end

    it 'must be a valid url' do
      @valid_material.source = 'http://google.com'
      expect(@valid_material.valid?).to be_truthy
    end

    it 'cannot be an invalid url' do
      @valid_material.source = 'google.com'
      expect(@valid_material.valid?).to be_falsey
    end
  end

  it 'gives the description of the difficulty level' do
    expect(@valid_material.difficulty_description).to eq(
      'No coding experience required.'
    )
  end
end
