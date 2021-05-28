require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:groups) }
    it { should have_many(:charities) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
