class CreateArps < ActiveRecord::Migration
  def change
    create_table :arps do |t|
      t.timestamps  null:false
    end
  end
end
