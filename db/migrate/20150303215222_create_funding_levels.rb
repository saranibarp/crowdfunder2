class CreateFundingLevels < ActiveRecord::Migration
  def change
    create_table :funding_levels do |t|
      t.references :project, null: false
      t.string :reward_name, null: false
      t.integer :amount, null: false
      t.timestamps null: false
    end
  end
end
