class Asset < ApplicationRecord
  has_many :asset_tags
  has_many :tags, through: :asset_tags
  has_one_attached :resource

  # Before updating an assets tags, we need to purge the existing tag <-> asset
  # relations in the join table. Otherwise we'll end up ADDING to that list
  # instead of CHANGING that list.
  before_save :unlink_tags

  # Accepts an array of tags, usually from params in the controller
  # and matches to the asset in question.
  def set_tags(tags)
    tags.each do |t|
      if t[0] != '#'
        t = "##{t}"
      end
      self.tags << Tag.find_or_create_by(hashtag: t.downcase)
    end
  end

private

  def unlink_tags
    unless id.blank?
      if tags.count > 0
        AssetTag.where(asset: self.id).delete_all
      end
    end
  end

end
