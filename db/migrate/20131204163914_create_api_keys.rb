class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :name
      t.string :url
      t.text :description
      t.string :access_token
      t.boolean :active, default: true

      t.timestamps
    end

    add_index :api_keys, :access_token
  end
end
