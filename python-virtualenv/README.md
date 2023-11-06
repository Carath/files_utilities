# virtualenv

Source: <https://virtualenv.pypa.io/en/latest/user_guide.html>


## Installation

```sh
pip install virtualenv
```

## Creating a virtual environment

```sh
virtualenv myenv
```

Note that using that command again in the same directory has no effect.


## Activating the virtual environment

```sh
source myenv/bin/activate
```

Now do stuff like pip install ...


## Deactivating

```sh
deactivate
```


## Dependency hell stuff

To show installed packages via pip: ``` pip freeze ``` or ``` pipdeptree ``` (to be installed).

To find a valid packages configuration from an incomplete *requirements.txt*, install and use the ``` pipgrip ``` package:

```sh
pip install pipgrip
pipgrip --lock -r requirements.txt
```

The generated ``` pipgrip.lock ``` file contains the completed list of packages.
