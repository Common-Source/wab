.PHONY: requirements migrations start stop

SHELL := /bin/bash
include .env

requirements:
	sudo apt install nodejs npm
	sudo npm install -g pm2
	npm install
	npm install pg --save

build:
	npm run build

migrations:
	mkdir -p migrations && npm run migrate

start:
	pm2 start dist/server.js --name wab

stop:
	pm2 stop wab
