class CreateMaterializedViewPetStatistics < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE MATERIALIZED VIEW pet_statistics
          AS
          SELECT kind, COUNT(*) AS pet_count
          FROM pet_strings
          GROUP BY kind;
        SQL
        execute <<-SQL
          REFRESH MATERIALIZED VIEW pet_statistics
        SQL
      end

      dir.down do
        execute <<-SQL
          DROP MATERIALIZED VIEW pet_statistics RESTRICT;
        SQL
      end
    end
  end
end
