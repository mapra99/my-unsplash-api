class OurMemoriesApiSchema < GraphQL::Schema
  use GraphqlDevise::SchemaPlugin.new(
    query:            Types::QueryType,
    mutation:         Types::MutationType,
    authenticate_default: false,
    resource_loaders: [
      GraphqlDevise::ResourceLoader.new(
        User,
        skip: [
          :sign_up, # deprecated
          :update_password, # deprecated
          :send_password_reset, # deprecated
          :resend_confirmation, # deprecated
          :confirm_account, # deprecated
          :check_password_token, # deprecated
          :confirm_registration_with_token, # devise confirmable module won't be used for now
          :resend_confirmation_with_token # devise confirmable module won't be used for now
        ],
        operations: {
          register: Mutations::Users::Register
        }
      )
    ]
  )
  mutation(Types::MutationType)
  query(Types::QueryType)

  # Union and Interface Resolution
  def self.resolve_type(abstract_type, obj, ctx)
    # TODO: Implement this function
    # to return the correct object type for `obj`
    raise(GraphQL::RequiredImplementationMissingError)
  end

  # Relay-style Object Identification:

  # Return a string UUID for `object`
  def self.id_from_object(object, type_definition, query_ctx)
    # Here's a simple implementation which:
    # - joins the type name & object.id
    # - encodes it with base64:
    # GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
  end

  # Given a string UUID, find the object
  def self.object_from_id(id, query_ctx)
    # For example, to decode the UUIDs generated above:
    # type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    #
    # Then, based on `type_name` and `id`
    # find an object in your application
    # ...
  end
end
