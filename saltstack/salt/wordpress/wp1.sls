wp1-db:
  mysql_database.present:
   - name: wp1

wp1-user:
  mysql_user.present:
   - name: wp1
   - host: '%'
   - password: 'YGUFAv9E'

wp1-grant:
  mysql_grants.present:
   - user: wp1
   - database: wp1.*
   - host: '%'
   - grant: select,insert,update,delete,create,drop,alter,index
   - require: 
      - mysql_database: wp1
      - mysql_user: wp1

