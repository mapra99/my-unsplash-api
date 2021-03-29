module Types
  class MutationType < Types::BaseObject
    field :create_post, mutation: Mutations::Posts::Create
  end
end
