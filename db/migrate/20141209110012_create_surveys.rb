class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.integer :creator_id
      t.string :image_url

      t.timestamps
    end
  end
end
