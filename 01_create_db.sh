#!/bin/bash

set -eo pipefail

_create_drupal_database() {
  docker_process_sql --database=mysql <<-EOSQL
    CREATE DATABASE \`$1\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON \`$1\`.* TO '${SG_EXAM_DB_USERNAME}'@'%';
EOSQL
}

mysql_note "Creating user ${SG_EXAM_DB_USERNAME}"
docker_process_sql --database=mysql <<<"CREATE USER '$SG_EXAM_DB_USERNAME'@'%' IDENTIFIED BY '$SG_EXAM_DB_PASSWORD';"

mysql_note "Creating databases"
for DATABASE_NAME in $SG_EXAM_DB_NAME; do
  mysql_note "Creating ${DATABASE_NAME}"
  _create_drupal_database ${DATABASE_NAME}
done

mysql_note "Init databases"

mysql -u${SG_EXAM_DB_USERNAME} -p$SG_EXAM_DB_PASSWORD <<EOF
source $WORK_PATH/$FILE_0;