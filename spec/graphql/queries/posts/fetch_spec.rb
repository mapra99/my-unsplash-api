require 'rails_helper'
require 'support/shared/valid_graphql_response'
require 'support/shared/paginated_response'

RSpec.describe 'GraphQL Queries::Posts::Fetch' do
  let!(:posts_list) { create_list(:post_with_image, 10) }

  context 'simplest fetch posts query' do
    let(:query_string) do
      <<-GRAPHQL
        query Query {
          fetchPosts {
            id
          }
        }
      GRAPHQL
    end

    subject { OurMemoriesApiSchema.execute(query_string) }
    it_should_behave_like 'valid graphql response'

    describe 'payload' do
      let(:payload) { subject['data']['fetchPosts'] }

      it 'contains all the current posts' do
        expect(payload).not_to be(nil)
        expect(payload).to be_kind_of(Array)
        expect(payload.length).to eq(posts_list.length)
      end

      it 'contains the posts sorted by date - newest first' do
        payload_post_ids = posts_list.reverse.pluck('id').map(&:to_i)
        post_ids = posts_list.reverse.pluck(:id)
        expect(payload_post_ids).to eq(post_ids)
      end
    end
  end

  context 'with pagination params' do
    let(:limit) { 5 }
    let(:offset) { 3 }

    let(:query_string) do
      <<-GRAPHQL
        query Query($limit: Int, $offset: Int) {
          fetchPosts(limit: $limit, offset: $offset) {
            id
          }
        }
      GRAPHQL
    end

    subject { OurMemoriesApiSchema.execute(query_string, variables: {limit: limit, offset: offset}) }
    it_should_behave_like 'valid graphql response'

    describe 'payload' do
      let(:payload) { subject['data']['fetchPosts'] }

      it_should_behave_like 'paginated response' do
        let(:list) { posts_list.reverse }
      end
    end
  end
end
