DB_NAME=mongodb
DB_IMAGE=mongo
DB_VERSION=4.4.0
DB_VOLUME=.docker/mongodb
MAIN=main.go

api-run:
	@go run ${MAIN}

db-start:
	@docker run --rm --name ${DB_NAME} -d --volume ${PWD}/${DB_VOLUME}:/data/db -p 27017:27017 ${DB_IMAGE}:${DB_VERSION}

db-stop:
	@docker stop ${DB_NAME}