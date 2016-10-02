#! /bin/sh

my_term() { 
  echo "Caught SIGTERM signal!" 
  kill -TERM "$child" 2>/dev/null
}

trap my_term SIGTERM

php-fpm &

child=$! 
wait "$child"
