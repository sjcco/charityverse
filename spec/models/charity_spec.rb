require 'rails_helper'

RSpec.describe Charity, type: :model do
  context 'associations' do
    it { should belong_to(:author) }
    it { should belong_to(:group) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount) }
  end
end
