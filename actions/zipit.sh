#/bin/bash
set -e
if [ ! -d virtualenv ]; then
  if [ -z $CLOUDSHELL ]; then
    docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp python:3.7 bash virtualenv_init.sh
  else
    # install virtualenv onto the cloud console
    PATH=~/.local/bin:$PATH
    ./virtualenv_init.sh
  fi
fi
zip -r vpclog.zip virtualenv __main__.py lib
