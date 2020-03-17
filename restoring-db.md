To restore, you need to mount the folder in a postgres instance, and then run `createdb` and `pg_restore` commands.

* To restore a database, run 
  * ```docker run -it --rm --network pg-network -v `pwd`:/data -e PGPASSWORD=testpassword postgres /bin/sh```

To create db and restoring:
  * northwind - `createdb -h postgres -U postgres northwind && pg_restore -h postgres -U postgres -d northwind /data/northwind.tar` 
  * pagila - `createdb -h postgres -U postgres pagila && pg_restore -h postgres -U postgres -d pagila /data/pagila.tar`
  * usda - `createdb -h postgres -U postgres usda && pg_restore -h postgres -U postgres -d usda /data/usda.tar`
  * AdventureWorks - `createdb -h postgres -U postgres AdventureWorks && pg_restore -h postgres -U postgres -d AdventureWorks /data/AdventureWorks.tar`
    * Ignore the 'schema "public" already exists' error
