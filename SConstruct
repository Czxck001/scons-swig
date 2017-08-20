import os
import os.path as op


def _get_std_includes():
    ''' Get GCC default include directories
    '''
    import re
    patt = re.compile(r'#include <\.\.\.> search starts here:'
                      r'\s([\s\S]*)End of search list\.')
    with os.popen('echo "" | gcc -xc - -v -E 2>&1') as p:
        txt = p.read()
    return ' '.join(['-I'+dirc
                     for dirc in next(patt.finditer(txt)).groups()[0].split()])


def swig_builder_action(target, source, env):
    with os.popen('python3-config --ldflags') as p:
        py3_ldflags = next(p).strip()
    with os.popen('python3-config --includes') as p:
        py3_includes = next(p).strip()

    swig_interface = env['SWIG_INTERFACE']
    swig_includes = ' '.join(['-I%s' % include
                              for include in env['SWIG_INCLUDES']])
    swig_base = op.splitext(op.basename(swig_interface))[0]
    module_python = swig_base + '.py'
    module_so = '_' + swig_base + '.so'
    c_wrap = swig_base + '_wrap.c'
    c_wrap_object = swig_base + '_wrap.o'
    source_objects = ' '.join([src_o.abspath for src_o in source])

    command = ' '.join([
        'swig -python -includeall %s %s %s' % (_get_std_includes(),
                                               swig_includes, swig_interface),
        '&& gcc -O2 -fpic %s %s -c %s' % (py3_includes, swig_includes, c_wrap),
        '&& gcc -shared %s %s %s -o %s' % (
            c_wrap_object, source_objects, py3_ldflags, module_so
        )
    ])
    assert all(tgt == op.abspath(obli) for tgt, obli in zip(
        [_tgt.abspath for _tgt in target],
        [module_python, module_so, c_wrap, c_wrap_object]
    ))
    os.system(command)


def swig_wrap_python(interface, includes, source, env):
    envc = env.Clone(SWIG_INTERFACE=interface,
                     SWIG_INCLUDES=includes)
    swig_base = op.splitext(op.basename(interface))[0]
    module_python = swig_base + '.py'
    module_so = '_' + swig_base + '.so'
    c_wrap = swig_base + '_wrap.c'
    c_wrap_object = swig_base + '_wrap.o'
    tgts = envc.SwigWrapPython([
        module_python, module_so, c_wrap, c_wrap_object
    ], source)
    return tgts


env = Environment()
SwigWrapPython = Builder(action=swig_builder_action)
env.Append(BUILDERS={'SwigWrapPython': SwigWrapPython})

Export('env')
objs = []
objs += SConscript('./fold1/SConscript')
objs += SConscript('./fold2/SConscript')


swig_wrap_python('example.i', ['fold1/inc'], objs, env)
