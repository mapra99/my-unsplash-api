require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { create(:post) }

  context 'associations' do
    it { should have_one_attached(:image) }
  end

  context 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe '#image_url', skip_gh_actions: true do
    it 'returns a URL for the image' do
      image_url = subject.image_url
      expect(image_url).not_to be_empty
      expect(image_url).to match(URI::DEFAULT_PARSER.make_regexp)
    end
  end
end
