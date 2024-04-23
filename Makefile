export pytest_show=all
export a
export v
export t="."

test:
	poetry run coverage run -m pytest -x --ignore=tests/app -p no:warnings --show-capture=$(pytest_show) --failed-first $(args) tests/$(t)

lint:
	poetry run ruff $(a) $(t)

check: lint test

test.migrate:
	cd tests && poetry run python ../codo $(a) migrate $(v)

