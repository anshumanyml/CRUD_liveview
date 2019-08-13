```
docker-compose build
docker-compose run app mix phx.new . --app myapp --database mysql
docker-compose up --build -d
docker-compose exec app mix phx.gen.html Accounts User users name:string email:string phone_number:string
docker-compose up
docker-compose down
```