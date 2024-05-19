class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_image
  
  validates :user_id, uniqueness: {scope: :post_image_id}
  #user_idとpost_image_idのペアが一意である（重複しない）状態に制限.
end
