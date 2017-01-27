 createuser $DBUSER -h $PGHOST

 echo "ALTER USER \"$DBUSER\" WITH LOGIN;" | $PGDO psql postgres -h $PGHOST
 echo "ALTER USER \"$DBUSER\" WITH PASSWORD '$DBPASS';" | $PGDO psql postgres -h $PGHOST

 $PGDO createdb --owner $DBUSER $DBNAME -h $PGHOST

 echo "CREATE EXTENSION hstore;" | $PGDO psql -h $PGHOST $DBNAME
