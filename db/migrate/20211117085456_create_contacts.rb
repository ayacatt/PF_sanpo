class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.text :message, null: false
      t.integer :contact_status, default: 0
      t.timestamps
    end
  end
end
