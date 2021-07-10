class ApplicationController < ActionController::API
  include GraphqlDevise::Concerns::SetUserByToken
  include ActiveStorage::SetCurrent
end
