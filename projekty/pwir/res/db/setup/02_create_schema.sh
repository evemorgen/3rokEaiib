#!/bin/bash

cat ../schema/schema.sql | $PGDO psql -h $PGHOST $DBNAME
