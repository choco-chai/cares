class CreateCareUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :care_users do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
