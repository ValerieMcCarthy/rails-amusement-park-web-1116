class CreateUsers < ActiveRecord::Migration
 create_table :users do |t|
    t.string :name
    t.string :password
    t.string :password_digest
    t.integer :nausea
    t.integer :happiness
    t.integer :height
    t.integer :tickets
    t.boolean :admin, default: false,  null: false
  end
end
