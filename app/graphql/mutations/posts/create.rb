module Mutations
  class Posts::Create < BaseMutation
    description 'Creates a new post'

    argument :title, String, required: true
    argument :signed_blob_id, String, required: true

    type Types::PostType

    def resolve(title:, signed_blob_id:)
      raise GraphQL::ExecutionError, 'Title is blank' if title.blank?
      raise GraphQL::ExecutionError, 'Signed blob id is blank' if signed_blob_id.blank?

      post = Post.new(title: title)
      post.image.attach(signed_blob_id)

      raise GraphQL::ExecutionError, post.errors.full_messages.join(', ') unless post.save

      post
    end
  end
end
