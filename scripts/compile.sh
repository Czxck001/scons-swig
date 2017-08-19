swig -python -includeall -Ifold1 example.i
gcc -O2 -fpic -c fold2/multiply.c
gcc -O2 -fpic -Ifold2 -c fold1/example.c
gcc -O2 -fpic -c example_wrap.c -Ifold1 -I/usr/local/Cellar/python3/3.6.2/Frameworks/Python.framework/Versions/3.6/include/python3.6m -I/usr/local/Cellar/python3/3.6.2/Frameworks/Python.framework/Versions/3.6/include/python3.6m
gcc -shared example.o example_wrap.o multiply.o -L/usr/local/opt/python3/Frameworks/Python.framework/Versions/3.6/lib/python3.6/config-3.6m-darwin -lpython3.6m -ldl -framework CoreFoundation -o _example.so
