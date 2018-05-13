class Document < ApplicationRecord
  attr_accessor :attachment
  has_many :tags
  belongs_to :user
  accepts_nested_attributes_for :tags, :allow_destroy => :true

  mount_base64_uploader :attachment, AttachmentUploader
end
