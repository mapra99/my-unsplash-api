module Queries
  module Posts
    class Fetch < ::Queries::BaseQuery
      description 'Returns the posts feed'
      argument :limit, Int, required: false
      argument :offset, Int, required: false

      type [Types::PostType], null: true

      def resolve(limit: nil, offset: nil)
        posts = Post.sorted_by_newest
        posts = posts.paginate(limit, offset) if limit.present? && offset.present?

        posts
      end
    end
  end
end
