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



