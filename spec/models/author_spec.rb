require 'rails_helper'

RSpec.describe Author , type: :model do

  describe "validations" do
    it "requires a first name" do
      author = Fabricate.build(:author, first_name: nil)
      expect(author).not_to be_valid
    end

    it "requires a last name" do
      author = Fabricate.build(:author, last_name: nil)
      expect(author).not_to be_valid
    end


  end

  describe "#full_name" do
    it "returns full name of author" do
      author = Fabricate(:author, first_name: 'Bob', last_name: 'Last')
      expect(author.full_name).not_to be_nil
      expect(author.full_name).to eq("Bob Last")

    end
  end
end
