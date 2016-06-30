# mariagalera
MariaDB + Galera


## Bootstrap the first node:

<pre>
docker run -d --name node1 wfong/mariagalera
</pre>

## Join additional nodes:

<pre>
docker run -d --name node2 --link node1:galera wfong/mariagalera
</pre>

Change 'node1' for the actual name you used in the bootstrap node.

Verify replication：
<pre>
mysql -u root -p -e 'CREATE DATABASE clustertest;'
mysql -u root -p -e 'CREATE TABLE clustertest.mycluster ( id INT NOT NULL AUTO_INCREMENT, name VARCHAR(50), ipaddress VARCHAR(20), PRIMARY KEY(id));'
mysql -u root -p -e 'INSERT INTO clustertest.mycluster (name, ipaddress) VALUES ("db1", "1.1.1.1");'
</pre>

mysql -u root -p -e 'SELECT * FROM clustertest.mycluster;'
Enter password: 
+----+------+-----------+
| id | name | ipaddress |
+----+------+-----------+
| 2  | db1  | 1.1.1.1   |
+----+------+-----------+

Now do the check on node node2:
mysql -u root -p -e 'SELECT * FROM clustertest.mycluster;'
Enter password: 
+----+------+-----------+
| id | name | ipaddress |
+----+------+-----------+ 
| 2  | db1  | 1.1.1.1   |
+----+------+-----------+


