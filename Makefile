SHELL:=/usr/bin/env bash

.PHONY: lint
lint:
	poetry run mypy mdb_shop
	poetry run flake8 mdb_shop tests
	poetry run pylintrc test

.PHONY: unit
unit:
	poetry run pytest

.PHONY: package
package:
	poetry run poetry check
	poetry run pip check
	poetry run safety check --full-report

.PHONY: test
test: lint unit package