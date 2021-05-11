require 'rails_helper'
require 'support/shared/valid_graphql_response'

RSpec.describe 'GraphQL Mutations::Posts::Create' do
  let(:title) { 'Post title' }
  let(:signed_blob_id) do
    'eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBJUT09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--1fc4dd6899c76edb6e5ff96ffa7d8a77bcdc8611'
  end

  context 'common post creation mutation' do
    let(:mutation_string) do
      <<-GRAPHQL
        mutation CreatePostMutation($createPostInput: CreateInput!) {
          createPost(input: $createPostInput) {
            title
            imageUrl
          }
        }
      GRAPHQL
    end

    subject do
      MyUnsplashApiSchema.execute(mutation_string,
                                  variables: { createPostInput: { title: title,
                                                                  signedBlobId: signed_blob_id } })
    end

    before do
      allow_any_instance_of(ActiveStorage::Attached::One).to receive(:attach).and_return('attached :)')
    end

    it_should_behave_like 'valid graphql response'
    it 'creates a new post' do
      expect { subject }.to(change { Post.count })
    end

    describe 'payload' do
      let(:payload) { subject['data']['createPost'] }

      it 'returns the created post type' do
        expect(payload).not_to be_empty
        expect(payload['title']).to eq(title)
        expect(payload).to have_key('imageUrl')
      end
    end
  end
end
