class AddUuidExtension < ActiveRecord::Migration[7.2]
  def up
    execute <<~SQL.squish
      CREATE extension IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
      COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
      CREATE OR REPLACE FUNCTION public.prefixed_uuid_generate_v4(prefix character varying) RETURNS character varying
        LANGUAGE plpgsql
        AS $$
      BEGIN
        RETURN concat(prefix, '_', uuid_generate_v4());
      END;
      $$;
    SQL
  end
end
