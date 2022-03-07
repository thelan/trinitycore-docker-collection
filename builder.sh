#!/bin/bash

WORKDIR=$(dirname $0)
ENVFILE="${WORKDIR}/.env"

# Default args
NBPROC=$(nproc || echo 1)
DOCKER_BASEIMAGE="trinitycore"
DOCKER_PUSH="false"

if [ -f ${ENVFILE} ]
then
	echo "Sourcing variables from ${ENVFILE}"
	export $(cat .env | xargs)
fi

function fail()
{
	>&2 echo $@
	exit 2
}

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -b|--docker-base-imagename)
      DOCKER_BASEIMAGE="$2"
      shift
      shift
      ;;
    -j)
      NBPROC="$2"
      shift
      shift
      ;;
    -p|--push)
      DOCKER_PUSH="true"
      shift
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

for vers in ${POSITIONAL_ARGS[@]}
do
	test -d $vers || fail "directory ${vers} not found"
	cd $vers
	test -f Dockerfile || fail "Dockerfile not found in $(pwd)"
	docker build -t ${DOCKER_BASEIMAGE}:${vers} .
	if [ ${DOCKER_PUSH} == "true" ]
	then
		docker push ${DOCKER_BASEIMAGE}:${vers}
	fi
	cd ..
done

