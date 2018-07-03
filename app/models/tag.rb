class Tag < ApplicationRecord
  belongs_to :tool, dependent: :destroy
end


