class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      #should description be type text?
      t.string :description

      t.timestamps null: false
    end
  end
end
