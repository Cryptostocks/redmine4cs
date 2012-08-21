class CreateCryptostocks < ActiveRecord::Migration
  def change
    create_table :cryptostocks do |t|
      t.string :paramname
      t.string :paramvalue
    end
    add_index :cryptostocks, :paramname
  end
end
