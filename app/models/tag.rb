class Tag < ApplicationRecord
  belongs_to :document, optional: true
end
