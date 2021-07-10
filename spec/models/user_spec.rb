require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    subject { build(:user) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
  end
end
