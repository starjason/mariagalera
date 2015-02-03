FROM centos:centos6
MAINTAINER Will Fong <will.fong@mariadb.com>

COPY MariaDB.repo /etc/yum.repos.d/

RUN yum -y install MariaDB-Galera-server which
RUN curl -o /etc/my.cnf https://raw.githubusercontent.com/willfong/supporttools/master/docker_configs/m10g.cnf

EXPOSE 3306 4444 4567 4568

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["mysqld"]
