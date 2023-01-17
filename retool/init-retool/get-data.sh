#!/bin/bash

docker exec -t retool-onpremise_postgres_1 \
    pg_dump ${RETOOL_POSTGRES_DB} --no-acl --no-owner --clean \
    -U  postgres > pgdumps/retool_db_dump.sql
