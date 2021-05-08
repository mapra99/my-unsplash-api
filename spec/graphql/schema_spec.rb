require 'rails_helper'

RSpec.describe 'GraphQL Schema' do
  context 'dump snapshot' do
    subject { MyUnsplashApiSchema.to_definition }
    let(:snapshot_definition) { File.read(Rails.root.join("app/graphql/schema.graphql")) }

    it 'should equal the current schema definition' do
      expect(subject).to match(snapshot_definition)
    end

    # TODO: https://github.com/xuorig/graphql-schema_comparator
    xit "shouldn't involve breaking changes with current deployed branch schema"
  end
end
