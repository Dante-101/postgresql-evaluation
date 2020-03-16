# Postgresql Evaluation

Testing and evaluating postgresql. Has code from udemy's course, "Learn SQL Using PostgreSQL: From Zero to Hero"

## Setup
* Run `docker-compose up -d` to bring up postgres and pgadmin
* Go to `http://localhost:8080` to open pgadmin. Use the username and password in `docker-compose.yml` file to login
* To stop use, `docker-compose stop`. 
* To tear down the stack, use `docker-compose down`

* To connect via `psql` after `docker-compose`, use 
  * `docker run -it --rm --network pg-network -e PGPASSWORD=testpassword postgres psql -h postgres -U postgres`
