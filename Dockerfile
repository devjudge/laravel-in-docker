FROM composer:1.9

COPY app /tmp/app/
COPY artisan /tmp/
COPY vendor /tmp/vendor/
COPY bootstrap /tmp/bootstrap/
COPY config /tmp/config/
COPY database /tmp/database/
COPY public /tmp/public/
COPY resources /tmp/resources/
COPY routes /tmp/routes/
COPY storage /tmp/storage/
COPY tests /tmp/tests/
COPY webpack.mix.js /tmp/
COPY server.php /tmp/
COPY phpunit.xml /tmp/
COPY package.json /tmp/
COPY composer.json /tmp/
COPY composer.lock /tmp/

WORKDIR /tmp/

EXPOSE 8080

# Build the app
RUN wget https://codejudge-starter-repo-artifacts.s3.ap-south-1.amazonaws.com/backend-project/laravel/build.sh
RUN chmod 775 ./build.sh
RUN sh build.sh

# Add extra docker commands here (if any)...

# Run the app
RUN wget https://codejudge-starter-repo-artifacts.s3.ap-south-1.amazonaws.com/backend-project/laravel/run.sh
RUN chmod 775 ./run.sh
CMD sh run.sh


