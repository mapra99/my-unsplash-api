class Api::V1::DirectUploadsController < ActiveStorage::DirectUploadsController
  protect_from_forgery except: :create
end
