class Trending < ActiveRecord::Base
    has_many :trending_comments
    end