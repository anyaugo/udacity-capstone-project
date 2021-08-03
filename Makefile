setup:
	python3 -m venv ~/.devops
	source ~/.devops/bin/activate

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt
	# Install hadolint
	wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
	chmod +x /bin/hadolint

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# Lint Dockerfile
	hadolint Dockerfile
	# Lint pyhton flask app
	pylint --disable=R,C,W1203 app.py

all: install lint test