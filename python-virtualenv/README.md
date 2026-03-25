# Python virtual environments

Sources:
- <https://virtualenv.pypa.io/en/latest/user_guide.html>
- <https://docs.python.org/3/library/venv.html>


## Initial setup

```sh
sudo apt-get update
sudo apt-get install -y python3-pip python3-virtualenv software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
```

Then to install a specific version of Python, e.g. ``` 3.12 ```:

```sh
sudo apt-get install -y python3.12
```


## Creating the virtual environment

For a chosen directory name, e.g. ``` my_env ```:

### Using *virtualenv* (recommended)

```sh
virtualenv --python=$(which python3.12) my_env
```

Note that the Python version may be omitted when using the default one.


### Using default Python's venv

The Python version cannot be changed here, it *has to* be the default one:

```sh
python3 -m venv my_env
echo "*" > my_env/.gitignore
```


## Installing packages

From a ``` requirements.txt ``` file, to generating a lock file:

```sh
. my_env/bin/activate
pip install -r requirements.txt
pip freeze > freeze.lock
deactivate
```


## Usage

Activate the virtual env with ``` . my_env/bin/activate ```, and deactivate it with ``` deactivate ```.


## Dependency hell stuff

To show installed packages via pip: ``` pip freeze ``` or ``` pipdeptree ``` (to be installed).

To find a valid packages configuration from an incomplete *requirements.txt*, install and use the ``` pipgrip ``` package:

```sh
pip install pipgrip
pipgrip --lock -r requirements.txt
```

The generated ``` pipgrip.lock ``` file contains the completed list of packages, install them with:

```sh
pip install -r pipgrip.lock
```


## TODO

Add a section about [uv](https://docs.astral.sh/uv/).
