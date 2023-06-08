#!/usr/bin/env bash
set -euo pipefail

export RENPY_DEPS_INSTALL="/usr:/usr/lib/$(gcc -dumpmachine)/"
export RENPY_CYTHON=cython

printf 'export RENPY_DEPS_INSTALL=%s\n' "'${RENPY_DEPS_INSTALL}'" >> /etc/bash.bashrc
printf 'export RENPY_CYTHON=%s\n' "'${RENPY_CYTHON}'" >> /etc/bash.bashrc

pip install -U cython future six typing pefile requests ecdsa

if [ ! -d pygame_sdl2/.git ]; then
    [ -d pygame_sdl2 ] && rm -r pygame_sdl2
    git clone --depth 1 https://www.github.com/renpy/pygame_sdl2
else
    pushd pygame_sdl2
    git pull
    popd
fi

pushd pygame_sdl2
python setup.py install
python setup.py install_headers
popd

pushd module
python setup.py install
popd
