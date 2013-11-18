class CreateLinkViews < ActiveRecord::Migration
  def change
    create_table :link_views do |t|
      t.integer :url_id

      t.timestamps
    end
  end
end
