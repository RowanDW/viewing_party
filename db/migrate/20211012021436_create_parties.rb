class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :movie
      t.integer :duration
      t.date :day
      t.time :start_time
      t.references :host, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
