simpleid:
        image: bmwcarit/komenco-base-simpleid
        hostname: simpleid
        domainname: localdomain
        expose:
         - "443"
komenco:
        build: komenco
        hostname: komenco
        domainname: localdomain
        ports:
         - "80"
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
        expose:
         - "4444"
