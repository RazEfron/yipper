# == Schema Information
#
# Table name: yips
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Yip < ApplicationRecord
    validates :body, presence: true
    # validates :author_id, presence: true 
    #we don't need line 13 because rails will automatically 
    #validate the foreign key in a belongs_to
    validate :body_too_long # custom validation


    #  belongs_to is a ruby method with two arguments (arg1, options)

    # belongs_to( :author,
    #     {primary_key: :id,
    #     foreign_key: :author_id,
    #     class_name: :User,
    #     optional: true} )

    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User

    has_many :likes,
        class_name: :Like,
        primary_key: :id, 
        foreign_key: :yip_id

    has_many :likers,
        through: :likes,
        source: :liker

    def body_too_long
        # Rails gives us an implicit getter for column names. body == self.body
        # body returns the body of the chirp
        if body && body.length > 140
            errors[:body] << 'is too long.'
        end
    end




    # PT 3

    # #Find all yips for a particular user
    # User.find_by(username: "instructors_rock").yips
    # Yip.joins(:author).where(users: {username: "instructors_rock"}) # this is preferred, because we're querying on the model we're working from


    # #Find all yips liked by people politically affiliated with JavaScript
    # Yip.joins(:likers).where(users: {political_affiliation: "JavaScript"})

    # #Get only the unique values from the previous query
    # Yip.joins(:likers).where(users: {political_affiliation: "JavaScript"}).distinct


    # #Find all yips with no likes
    # Yip.left_outer_joins(:likes).where(likes: {id: nil})
    # # default joins gives us rows that match in both (yip to likes, likes to yips)
    # # left outer joins: the model that receives the .left_outer_joins method is the left table

    # #Find how many likes each yip has
    # Yip.select(:body, "COUNT(likes.id) as num_likes").left_outer_joins(:likes).group(:id)
    # # if we don't specificy which table the column is coming from, it defaults to the model we call the method on
    # # In SQL, this would look like: SELECT yips.body, COUNT(likes.id) AS num_likes FROM yips LEFT JOIN likes ON yips.id = likes.yip_id GROUP BY yips.id;

    # #Find yips with at least 3 likes
    # # Yip.joins(:likes).group(:id).having("COUNT(*) >= ?", 3).select(:body)
    # Yip.joins(:likes).group(:id).having("COUNT(*) >= ?", 3).pluck(:body)























    # # PT 4
    
    # # Includes #

    # def self.see_yip_authors_n_plus_one
    #     # the "+1"
    #     yips = Yip.all

    #     # the "N"
    #     yips.each do |yip|
    #         puts yip.author.username
    #     end

    # end






    # def self.see_yips_optimized
    #     # pre-fetches data
    #     yips = Yip.includes(:author).all

    #     yips.each do |yip| 
    #     # uses pre-fetched data 
    #         puts yip.author.username
    #     end
    # end



    # # Joins #

    # def self.see_yip_num_likes_n_plus_one
    #     yips = Yip.all

    #     # the N
    #     yips.each do |yip|
    #         puts yip.likes.length
    #         # each .likes is a query, so expensive!
    #     end
    # end





    # def self.see_yip_num_likes_optimized
    #     yips_with_likes = Yip
    #         .select("yips.*, COUNT(*) AS num_likes")
    #         .joins(:likes)
    #         .group(:id)
    
    #     yips_with_likes.each do |yip|
    #         puts yip.num_likes
    #         # num_likes appeared due to ln 152's aggregate alias 'num_likes'
    #         # now we can use .num_likes on each instance
    #         # we're accessing pre-loaded data when calling .num_likes 
    #     end
    # end

end
