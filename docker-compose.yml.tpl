simpleid:
        image: bmwcarit/komenco-base-simpleid
        hostname: simpleid
        domainname: localdomain
komenco:
        build: komenco
        hostname: komenco
        domainname: localdomain
        volumes:
         - ${SOURCE_FOLDER}:/data/src
        links:
         - simpleid:openid
        environment:
         - APP_ENVIRONMENT=dev
         - DEV_UID=${DEV_UID}
test:
        image: bmwcarit/komenco-base-test
        hostname: test
        domainname: localdomain
        volumes_from:
         - komenco
        links:
         - komenco:komenco
         - selenium:selenium
        environment:
         - APP_ENVIRONMENT=dev
         - DEV_UID=${DEV_UID}
selenium:
        image: bmwcarit/komenco-base-selenium
