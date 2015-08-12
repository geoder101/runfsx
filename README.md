# Synopsis

[![Build Status](https://travis-ci.org/geoder101/runfsx.svg?branch=master)](https://travis-ci.org/geoder101/runfsx)

`runfsx` is a program to run F# scripts (.fsx).

Currently it is merely a convenient wrapper for `fsharpi --quiet --exec`
but maybe in the future could do additional things,
like maintaining precompiled files for faster startups.

# Usage

Its main purpose is to be used in a [shebang][shebang] declaration:

[shebang]: https://en.wikipedia.org/wiki/Shebang_(Unix)

```bash
#!/usr/bin/env runfsx
printfn "Hello World"
```

# Installation

You can install `runfsx` via npm:

```bash
npm install -g geoder101/runfsx
```

# Licensing

This project is licensed under the MIT license.  
See [LICENSE](LICENSE) for the full license text.
