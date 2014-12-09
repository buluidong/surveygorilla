class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.belongs_to :survey
      t.integer :taker_id

      t.timestamps
    end
  end
end
