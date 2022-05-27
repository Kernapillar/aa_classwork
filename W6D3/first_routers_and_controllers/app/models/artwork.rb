# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer          not null
#
class Artwork < ApplicationRecord

    
    
    validates :artist_id, uniqueness: { scope: :title }
    
    
    belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User
    
    
    has_many :shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare 
    
    has_many :shared_viewers,
    through: :shares,
    source: :viewer

    has_many :comments,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy 
    
    def self.get_user_artwork(user_id)
        Artwork
            .left_outer_joins(:shares)
            .where('(artworks.artist_id = :user_id) OR artwork_shares.viewer_id = :user_id', user_id: user_id )
            .distinct
    end


    
end
