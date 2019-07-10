require 'rails_helper'

RSpec.describe CollectedDatum, type: :model do
  before do
    @collected_data = FactoryBot.create(:collected_datum)
  end

  context "validations" do
    it "is valid with valid attributes" do
      expect(@collected_data).to be_a(CollectedDatum)
      expect(@collected_data).to be_valid
    end
  end

  describe "value" do
    it "is not valid without value" do
      bad_data = FactoryBot.build(:collected_datum, value: nil)
      expect(bad_data).not_to be_valid
      expect(bad_data.errors.include?(:value)).to eq(true)
    end
    it "is valid when equal to numerator/denominator" do
      expect(@collected_data.value).to eq(@collected_data.numerator/@collected_data.denominator)
    end
  end

end
