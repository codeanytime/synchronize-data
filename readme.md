## Command

generate changes log

``
mvn liquibase:generateChangeLog
``

diff

``
mvn liquibase:diff
``

diff - data

``
mvn liquibase:diff -Dliquibase.diffTypes=data
``

update sql

``
mvn liquibase:updateSQL
``

Rollback changes

``
mvn liquibase:rollback -Dliquibase.rollbackCount=1
``