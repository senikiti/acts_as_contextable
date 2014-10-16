class ActsAsContextableMigration < ActiveRecord::Migration
  def self.up
    create_table :context_references do |t|
      t.references :contextable, :polymorphic => true
      t.references :context, :polymorphic => true
      t.timestamps
    end

    if ActiveRecord::VERSION::MAJOR < 4
      add_index :context_references, [:contextable_id, :contextable_type]
      add_index :context_references, [:context_id, :context_type]
    end
  end

  def self.down
    drop_table :context_references
  end
end