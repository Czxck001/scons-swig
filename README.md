# SCons-SWIG
A repo as an example for [SWIG](http://www.swig.org/) usage equipped with [SCons](http://www.scons.org/) build system.

## Gist of the Repo
In `SConstruct` file, several SCons builder and functions are made for wrap and build C code into Python modules, instructed by SWIG interface. The interface of this repo is defined in `example.i` file.

## Play with Example
```sh
scons
python3 client.py
```

## Usage
Just combine `SConstruct` with that in your project.


## TODO
1. Harness `emitter` argument which modify targets of `SCons.builder` to fully abstract SWIG's wrap & build operation.
2. Some other refactors to adopt a more idiomatic pattern.
