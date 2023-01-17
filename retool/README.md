Running Retool
---


## Set up the local environment

Set up a variable file with the environment's variables.

```
RETOOL_ENV=LOCAL
RETOOL_DOCKER_TAG=latest

RETOOL_JWT_SECRET=789791237asdasd99890890

RETOOL_LICENSE_KEY=none
RETOOL_POSTGRES_DB=hammerhead_production
RETOOL_POSTGRES_USER=retool_internal_user
RETOOL_POSTGRES_HOST=postgres
RETOOL_POSTGRES_PORT=5432
RETOOL_POSTGRES_PASSWORD=randomstring
RETOOL_COOKIE_INSECURE=true

```


## Source the variables for the environment you're on

source local-env.sh
source dev-env.sh
source stage-env.sh

