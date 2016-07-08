class CreateCachedResponses < ActiveRecord::Migration
  def change
    create_table :cached_responses do |t|
      t.string :username
      t.text :response
    end
  end
end
