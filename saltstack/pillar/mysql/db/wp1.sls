# mysql database 'wp1'
mysql:
  database:
    - wp1
  user:
    wp1:
      password: '7APtqUd7'
      host: 'localhost'
      databases:
        - database: wp1
          grants: ['select', 'insert', 'update', 'delete', 'create', 'drop', 'alter', 'index']

