# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  liker_id   :integer          not null
#  yip_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
    validates :liker_id, uniqueness: {scope: :yip_id}

    belongs_to :liker, 
        class_name: :User,
        foreign_key: :liker_id,
        primary_key: :id

    # belongs_to associations automatically validates the presence of the foreign key to be true

    # every instance of a model is automatically assigned an id, this is done under the hood by Rails

    belongs_to :yip,
        class_name: :Yip,
        foreign_key: :yip_id,
        primary_key: :id

end

# Like is a "joins table"