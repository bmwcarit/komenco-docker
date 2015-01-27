# Copyright (C) 2015, BMW Car IT GmbH
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.

FROM bmwcarit/komenco-base
MAINTAINER Michael Knapp <michael.knapp@bmw-carit.de>

# copy sources to the container
COPY komenco /data/src

# install dependencies
WORKDIR /data/src
RUN composer install --prefer-dist

# patch dependencies
RUN ./res/patches/apply-patches.sh vendor

# setup propel
RUN ./vendor/bin/propel --config-dir=config sql:build -vvv && \
	./vendor/bin/propel --config-dir=config model:build -vvv && \
	./vendor/bin/propel --config-dir=config config:convert -vvv && \
	./vendor/bin/propel --config-dir=config sql:insert -vvv

# link app to web directory
RUN ln -s /data/src /var/www/html/komenco

# give the default user full access
RUN chown -R $DEFAULT_UID /var/www/html/komenco && \
	chown -R $DEFAULT_UID /data/src

# patch app to run on /komenco/ web path
RUN sed -i 's!/index!/komenco/index!g' .htaccess && \
	sed -i 's!/vendor!/komenco/vendor!g' res/styles/main.less

# change to default working directory
WORKDIR /

# volume to mount dev environment
VOLUME /data/src

