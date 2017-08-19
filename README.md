# SCons-SWIG
A Repo as an example for [SWIG](http://www.swig.org/) usage equipped with [SCons](http://www.scons.org/) build system.

## Stem of the Repo
See `SConstruct` file.

## Usage
```sh
scons
python3 client.py
```


## TODO
1. Harness `emitter` argument which modify targets of `SCons.builder` to fully abstract SWIG's wrap & build operation.
