FROM composer:1.9

# Pre Build Commands
RUN wget https://codejudge-starter-repo-artifacts.s3.ap-south-1.amazonaws.com/backend-project/laravel/pre-build.sh
RUN chmod 775 ./pre-build.sh
RUN sh pre-build.sh

COPY . /tmp/

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


