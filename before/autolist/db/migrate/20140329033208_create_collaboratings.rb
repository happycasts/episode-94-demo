class CreateCollaboratings < ActiveRecord::Migration
  def change
    create_table :collaboratings do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
    add_index :collaboratings, :user_id
    add_index :collaboratings, :project_id
  end
end
