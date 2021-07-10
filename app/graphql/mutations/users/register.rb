module Mutations
  # this class is a monkey-patch of the GraphqlDevise userRegister mutation
  # to include additional user fields on sign up
  class Users::Register < GraphqlDevise::Mutations::Register
    argument :name, String, required: true
    argument :username, String, required: true
  end
end
