#!/bin/bash

if [[ $SEMAPHORE_TRIGGER_SOURCE != 'scheduler' ]]
then echo 'Not scheduled build.' && exit
fi

set -o errexit

for image in $IMAGES; do
    cd $image
    docker build --tag franklinyu/$image . | cat
    docker push franklinyu/$image | cat
    cd ..
done
