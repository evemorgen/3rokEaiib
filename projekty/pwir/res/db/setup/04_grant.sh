#!/bin/bash

echo "grant SELECT, INSERT, UPDATE, DELETE on all tables in schema public to \"$DBUSER\"" | $PGDO psql -h $PGHOST $DBNAME
echo "grant EXECUTE on all functions in schema public to \"$DBUSER\"" | $PGDO psql -h $PGHOST $DBNAME
echo "grant USAGE, SELECT on all sequences in schema public to \"$DBUSER\"" | $PGDO psql -h $PGHOST $DBNAME
