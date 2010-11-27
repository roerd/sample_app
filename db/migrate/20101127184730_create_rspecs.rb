class CreateRspecs < ActiveRecord::Migration
  def self.up
    create_table :rspecs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :rspecs
  end
end
