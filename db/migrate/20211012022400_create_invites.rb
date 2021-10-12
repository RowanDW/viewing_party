class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.references :party, foreign_key: true
      t.references :guest, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
