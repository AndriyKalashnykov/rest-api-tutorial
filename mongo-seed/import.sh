#! /bin/bash

mongoimport --host mongo --db test -u root -p password --authenticationDatabase=admin --collection census --type json --file ./mongo-seed/census.json --jsonArray
# mongoimport --uri "mongodb://root:password@mongo:27017/test?ssl=false&authSource=admin" --collection census --type json --file ./mongo-seed/census.json --jsonArray