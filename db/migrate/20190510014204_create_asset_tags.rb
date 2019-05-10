class CreateAssetTags < ActiveRecord::Migration[5.2]
  def change
    create_table :asset_tags do |t|
      t.integer     :asset_id
      t.integer     :tag_id
      t.timestamps
    end
  end
end
