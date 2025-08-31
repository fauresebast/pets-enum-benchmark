class CreatePetPgsqlEnum < ActiveRecord::Migration[7.2]
  def change
    create_enum :pet_kind, %w[cat dog rabbit owl].freeze

    create_table :pet_pgsql_enums do |t|
      t.enum :kind, enum_type: :pet_kind, null: false
      t.string :name
      t.float :weight
      t.date :birthday
      t.timestamps
    end
  end
end
