webserver using libuv and http-parser
====================================

I have found lots of libuv and http-parser webserver based on ryan's video tutorial.

[https://vimeo.com/24713213](https://vimeo.com/24713213)

My motivation is to update those tutorials to latest libuv and latest http-parser.

# Usage

```
$ git submodule update --init --recursive
$ cd libuv
$ sh autogen.sh
$ ./configure
$ make
$ make check
$ make install
$ cp .libs/libuv.a .
$ cd ..
$ make webserver
$ ./webserver 
# listening on 8000
```
