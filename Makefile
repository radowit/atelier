ALL_PYTHON_DIRS = atelier tests

# INSTALL

install:
	poetry install

# TESTING

test:
	pytest

test-cov:
	pytest --cov

pytest-dev:
	pytest --cov -svvx

# FORMATTING

fmt-black:
	black $(ALL_PYTHON_DIRS)

fmt-isort:
	isort $(ALL_PYTHON_DIRS)

format: fmt-black fmt-isort

# LINTING

lint-black:
	black --check $(ALL_PYTHON_DIRS)

lint-isort:
	isort --check-only --diff $(ALL_PYTHON_DIRS)

lint-pylint:
	pylint $(ALL_PYTHON_DIRS)

lint-pycodestyle:
	pycodestyle $(ALL_PYTHON_DIRS)

lint-bandit:
	bandit -r atelier

lint-mypy:
	mypy atelier

lint: lint-black lint-isort lint-pycodestyle lint-bandit lint-mypy lint-pylint

# General

prcheck: install format lint test-cov
