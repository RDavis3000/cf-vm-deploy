# Fullcam env vars
export FULLCAMTAG=develop

# hasura and creditcounter (cc) env vars
export HASURAUSER=
export HASURAPASSWORD=
export PGUSER=cc@cfr-azu-db01
export PGPASSWORD=
export PGHOST=cfr-azu-db01.postgres.database.azure.com
export PGPORT=5432
export PGDATABASE=gis1
export CCTAG=develop
export HASURA_VERSION_TAG=v1.3.2
# set this to syslog in production
export CCLOGGERTYPE=local


# metabase env vars

export MB_DB_TYPE=postgres
export MB_DB_DBNAME=metabase_dev
export MB_DB_PORT=5432
export MB_DB_USER=metabase_dev@cfr-azu-db01
export MB_DB_PASS=
export MB_DB_HOST=cfr-azu-db01.postgres.database.azure.com

# retool env vars

export RETOOL_ENV=production
export RETOOL_DOCKER_TAG=2.70.21
#export RETOOL_DOCKER_TAG=latest

export RETOOL_JWT_SECRET=789791237asdasd99890890

export RETOOL_LICENSE_KEY=d24a9875-3044-47e5-9482-4603befe4dd6
export RETOOL_POSTGRES_DB=hammerhead_production
export RETOOL_POSTGRES_USER=retool_internal_user
export RETOOL_POSTGRES_HOST=postgres
export RETOOL_POSTGRES_PORT=5432
export RETOOL_POSTGRES_PASSWORD=randomstring
export RETOOL_COOKIE_INSECURE=true
export RETOOL_VERSION_LOCKED=true