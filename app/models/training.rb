class Training < ApplicationRecord
    has_attached_file :docu
    validates_attachment_content_type :docu, content_type: "application/pdf"
end
