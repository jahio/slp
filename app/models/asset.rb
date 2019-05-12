class Asset < ApplicationRecord
  has_many :asset_tags
  has_many :tags, through: :asset_tags
  has_one_attached :resource
end
