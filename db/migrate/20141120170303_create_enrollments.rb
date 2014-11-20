class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :course_id
      t.string  :course_name

      t.timestamps
    end
    add_index :enrollments, :user_id
    add_index :enrollments, [:user_id, :course_id]
  end
end
