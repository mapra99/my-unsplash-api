# manually sets the host url for active storage
module ActiveStorage::SetCurrentOnModel
  extend ActiveSupport::Concern

  included do
    after_initialize do
      ActiveStorage::Current.host = ENV.fetch('HOST_URL')
    end
  end
end
