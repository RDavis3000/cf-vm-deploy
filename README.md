# CF VM Deploy 2.0

Manage secrets, and deployment of CF creditcounter-related code and system configuration to target environments.

## Local Development Prerequisites

Install these on your local machine

  * Docker (CE) Desktop 
  * Bash and envsubst

This has been tested on MacOS (on an M1) and Ubuntu x86_64.

## What it does

This repository provides support for these functions:

  1. Generate docker compose configurations based on environment variables and secrets
  2. Pulling the latest version of retool and setting it up for version-constrained running
  3. Scripts for starting, stopping and viewing the logs of running compose applications

### Applications

The four application groups are:

  1. Creditcounter - called `cc`
  1. Hasura - called `hasura`
  2. Fullcam on wine on R/plumber - called `fullcam`
  3. Metabase - called `metabase`
  4. Retool - called `retool`

When running locally the layering is:

[Your Host] bash ->runs-> Docker Desktop ->runs-> Docker Containers (and Docker Compose)


## Starting the System Locally

Prepare your environment sourcing the local secrets:

```!shell
$ source ./local-env-sourceme.sh 
```

The `./local-env-sourceme.sh` are example configurations for a local run on your own computer. In production and other live environments set up the secrets in a safe place outside of the git repository.

Now generate the docker-compose projects for the applications by:

```!shell
$ ./generate-compose.sh
```

Now we need to pull the latest copy of retool and build the docker images locally. 

```!shell
$ pushd retool/init-retool
$ ./get-retool.sh
$ popd
```

To get going, simply go to a bash command line and type:

```!shell
$ ./start-docker.sh <application name>
```

The application names are listed above (in **Applications**).

# Azure Application gateway

An Azure Application Gateway has been created to make CreditCounter and Metabase services 
Internet-accessible. 

  * https://creditcounter.climatefriendly.com 
  * https://metabase.climatefriendly.com 

To provide valid TLS connections the Application Gateway has a listener with a *.climatefriendly.com
SSL certificate installed.

Metabase and CreditCounter both run on 10.0.1.9:

![Application Gateway Insights Diagram](images/azure-ag_metabase.png)

The general model for a gateway is:

```Application Gateway -> listener(s) -> routing rule -> service host:port```

The Application Gateway listens on a public Internet IP address and examines the requested hostname 
to choose the listener to use to handle the request. The Gateway hosts the SSL certificate (and its secret key) for establishing HTTPS/TLS connections. 

The two listeners are for CreditCounter and Metabase. The rules then route the connection to the VM running both services with the appropriate protocol (HTTP/HTTPS) and port for each service.

# Secrets

cat hasura-init.sql | docker secret create hasura_pgsql_init -


# Retool Stage and Dev Deployment

## References

  * Setup https://docs.retool.com/docs/setup-instructions
  * On Premise https://github.com/tryretool/retool-onpremise
  * Git workflow https://docs.retool.com/docs/retool-git-workflow

  