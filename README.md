# docker-freeciv

```
sudo docker run --name mysqld -e MYSQL_DATABASE=freecivdb -e MYSQL_USER=freeciv -e MYSQL_PASSWORD=freeciv  -e MYSQL_ROOT_PASSWORD=secret -d mysql
sudo docker run --rm -it -v ${PWD}:/root --link  mysqld:mysql freeciv /root/setup.sh
sudo docker run --name freeciv -d -p 5556:5556 -v ${PWD}:/srv --link mysqld:mysql -t freeciv 
```

