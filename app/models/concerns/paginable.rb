module Paginable
  extend ActiveSupport::Concern

  included do
    def self.paginate(limit, offset = 0)
      limit(limit).offset(offset)
    end
  end
end
