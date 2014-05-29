class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :image_url
      t.string :email
      t.string :password_hash
      t.text   :bio

      t.timestamps
    end
  end
end
