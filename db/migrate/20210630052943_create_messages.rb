class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :conversation, foreign_key: true
      t.references :user, foreign_key: true
      # , default: falseを追記
      t.boolean :read, default: false
      t.timestamps
    end
  end
end
