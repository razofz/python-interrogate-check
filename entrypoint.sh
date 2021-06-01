#!/bin/bash
set -ea

interrogate --version

FLAG=''
if [[ ${4} == true ]]; then FLAG=$FLAG'n' ; fi
if [[ ${5} == true ]]; then FLAG=$FLAG'p' ; fi
if [[ ${6} == true ]]; then FLAG=$FLAG's' ; fi
if [[ ${7} == true ]]; then FLAG=$FLAG'm' ; fi
if [[ ${FLAG} ]]; then FLAG=" -${FLAG}" ; fi
CMD="interrogate --fail-under $2 --generate-badge $3 $1 $FLAG"
echo $CMD

if $CMD | grep -q 'PASSED'; then
    $CMD
    exit 0
else 
    $CMD
    exit 1
fi

