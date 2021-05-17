#!/bin/bash
#
#
if [[ "$1" == "--version" ]]
then
docker-compose -f docker-compose_fhir_itk3.yml run --rm tkw_fhir_itk3 $1
	exit 0
else
	if [[ "$1" == "-d" ]]
	then
	docker-compose -f docker-compose_fhir_itk3.yml up -d
	else
		docker-compose -f docker-compose_fhir_itk3.yml up
	fi
fi
