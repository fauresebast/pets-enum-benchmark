class CreatePetPgsqlEnumIndices < ActiveRecord::Migration[7.2]
  def change
    create_table :pet_pgsql_enum_indices do |t|
      t.enum :kind, enum_type: :pet_kind, null: false
      t.string :name
      t.float :weight
      t.date :birthday
      t.timestamps
    end

    add_index :pet_pgsql_enum_indices, :kind
  end
end
