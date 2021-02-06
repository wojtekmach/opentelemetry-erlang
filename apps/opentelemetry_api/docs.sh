#!/bin/bash
set -e

# Setup:
#
#     mix escript.install github elixir-lang/ex_doc
#     asdf install erlang ref:master
#     asdf local erlang ref:master

# using 'dev' to have same build path for both mix and rebar3
mix compile
rebar3 as dev compile
rebar3 as dev edoc
version=`cat VERSION`
ex_doc "opentelemetry_api" $version "_build/dev/lib/opentelemetry_api/ebin" \
  --source-ref v${version} \
  --config docs.exs $@
