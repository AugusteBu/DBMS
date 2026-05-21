--table
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'username';
--views
SELECT table_name
FROM information_schema.views
WHERE table_schema = 'username';
--materialized
SELECT matviewname
FROM pg_matviews
WHERE schemaname = 'username';
--index
SELECT indexname, tablename
FROM pg_indexes
WHERE schemaname = 'username';
--triggers
SELECT trigger_name
FROM information_schema.triggers
WHERE trigger_schema = 'username';
SELECT routine_schema, routine_name 
FROM information_schema.routines
WHERE routine_schema = 'username';