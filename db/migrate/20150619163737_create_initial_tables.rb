class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)
      t.timestamps()
    end
    create_table(:shoes) do |t|
      t.column(:shoe_name, :string)
      t.timestamps()
    end
    create_table :shoes_stores, id: false do |t|
      t.belongs_to :shoe, index: true
      t.belongs_to :store, index: true
    end
  end
end
