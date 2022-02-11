up:
	docker compose up -d
build:
	docker compose build --no-cache --force-rm
nextjs-install:
	docker compose exec app npx create-react-app . --template redux-typescript --use-npm
create-project:
	mkdir -p project
	@make build
	@make up
	@make nextjs-install
	docker compose exec app npm install @material-ui/core
	docker compose exec app npm install @material-ui/icons
	docker compose exec app npm install @material-ui/lab
	docker compose exec app npm install react-icons
	docker compose exec app npm install axios@0.21.1
	docker compose exec app npm install formik --save
	docker compose exec app npm install formik-material-ui
	docker compose exec app npm install yup @types/yup
	docker compose exec app npm install @types/react-modal
	docker compose exec app npm install react-modal
stop:
	docker compose stop
down:
	docker compose down --remove-orphans
