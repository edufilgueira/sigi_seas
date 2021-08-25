#!/bin/bash

export PSQL_ENV_LANG=en_US.utf8
export RUBYGEMS_VERSION=2.7.6
export BUNDLER_VERSION=1.16.1
export PSQL_PORT_5432_TCP_PORT=5432
export MEMCACHED_PORT_11211_TCP_PROTO=tcp
export TZ=America/Fortaleza
export HOSTNAME=bf5325c8352f
export PSQL_PORT=tcp://172.17.0.3:5432
export PSQL_PORT_5432_TCP_ADDR=172.17.0.3
export PSQL_ENV_PG_VERSION=9.6.9-2.pgdg90+1
export RUBY_VERSION=2.5.0
export GEM_HOME=/usr/local/bundle
export MEMCACHED_PORT_11211_TCP_PORT=11211
export PSQL_ENV_GOSU_VERSION=1.10
export MEMCACHED_PORT_11211_TCP_ADDR=172.17.0.2
export MEMCACHED_ENV_MEMCACHED_SHA1=7d3807ed240597444c97e11b0f61d16964feff1c
export MEMCACHED_ENV_MEMCACHED_VERSION=1.5.9
export MEMCACHED_PORT=tcp://172.17.0.2:11211
export RAILS_RELATIVE_URL_ROOT=/sigi
export PWD=/usr/src/app/scripts
export HOME=/root
export PSQL_ENV_POSTGRES_PASSWORD=53@51q3e!Q#E
export PSQL_ENV_PG_MAJOR=9.6
export RAILS_SERVE_STATIC_FILES=true
export BUNDLE_PATH=/usr/local/bundle
export PSQL_NAME=/seas_principal_7000/psql
export BUNDLE_APP_CONFIG=/usr/local/bundle
export MEMCACHED_NAME=/seas_principal_7000/memcached
export PSQL_ENV_PGDATA=/var/lib/postgresql/data
export MEMCACHED_PORT_11211_TCP=tcp://172.17.0.2:11211
export RAILS_ENV=production
export RAILS_LOG_TO_STDOUT=true
export PSQL_PORT_5432_TCP_PROTO=tcp
export TERM=xterm
export BUNDLE_SILENCE_ROOT_WARNING=1
export RUBY_MAJOR=2.5
export BUNDLE_BIN=/usr/local/bundle/bin
export SHLVL=1
export PSQL_PORT_5432_TCP=tcp://172.17.0.3:5432
export RUBY_DOWNLOAD_SHA256=1da0afed833a0dab94075221a615c14487b05d0c407f991c8080d576d985b49b
export PATH=/usr/local/bundle/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export SECRET_KEY_BASE=9ec7f99d14329f2547576161a696c3cd2fc8b10d1b624ef5a5d9e97b6ea86ff95a8515668931e7cd6bacd2901b6106e1f3c71c615f77068dccb1a64c2bbfad21
export OLDPWD=/etc
export _=/usr/bin/env

cd /usr/src/app/scripts

rails runner Veiculo.atualizar_status_disponivel
