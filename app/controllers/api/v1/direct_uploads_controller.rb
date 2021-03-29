class Api::V1::DirectUploadsController < ActiveStorage::DirectUploadsController
  # TODO: Find a workaround for this!!
  protect_from_forgery except: :create
end
