.PHONY: requirements migrations start stop

SHELL := /bin/bash
include .env

requirements:
	npm install
	npm install pg --save
	npm run build
	mkdir -p migrations

migrations:
	npm run migrate

start:
	pm2 start dist/server.js --name wab

stop:
	pm2 stop wab
