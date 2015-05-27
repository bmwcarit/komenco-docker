komenco docker containers
=========================

komenco is using docker containers to run everything from production to
development, even the tests are executed in a docker container. In fact the
production and the development container are one and the same and differ only
in the version of the komenco source code.

Installation
------------

### Prerequisites ###

The following software is required on your system:

* [docker](https://www.docker.com/)
* [docker-composer](https://docs.docker.com/compose/)

Many of the major distributions provide packages for docker, but as they are not
necessarily providing the latest versions of docker we recommend that you follow
the installation instructions on the docker website.

docker-compose can be currently installed via pip. Please see the
docker-compose page for up-to-date installation instructions for your system.

Before checking out this repository clone the docker configuration of the komenco
base containers and build them

    git clone https://github.com/bmwcarit/komenco-docker-base.git
    cd komenco-docker-base
    ./build.sh


### Setup ###

After checking out this repository with updated submodules you can
create the docker-compose configuration

    git clone --recursive https://github.com/bmwcarit/komenco-docker.git
    cd komenco-docker
    ./setup.sh [PATH TO YOUR KOMENCO SOURCE FOLDER]

And finally create the docker containers

    docker-composer build


Usage
-----

Start the containers:

    docker-compose up -d

Stop the containers:

    docker-compose stop

Rebuild images:

    docker-compose build

Run tests:

    docker-compose run test <CODECEPTION OTIONS>

Browse komenco:
    http://<IP ADDRESS OF KOMENCO CONTAINER>


License
-------

This project is licensed under the MIT license.
