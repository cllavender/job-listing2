class Resume < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.

  validates :content, presence: true
  belongs_to :user
  belongs_to :job
end
