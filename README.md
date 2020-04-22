# yellowjacket

A quick cli tool that translates YAML to JSON.

## Installation

- Build the program with `shards build`
- Install the program by adding `build/yellowjacket` to your PATH somehow

## Usage

```
$ cat zoo.yml
animals:
  - lion
  - tiger

# when no arguments are provides, reads from STDIN
$ cat zoo.yml | yellowjacket
{"animals":["lion","tiger"]}

# when provided one argument, reads that as a file
$ yellowjacket zoo.yml
{"animals":["lion","tiger"]}

# when provided more than one argument, reminds you that you should provide 0 or 1 argument
$ yellowjacket zoo.yml zoo2.yml
usage: yellowjacket [FILENAME]
```

## Contributing

1. Fork it (<https://github.com/willamin/yellowjacket/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Will Lewis](https://github.com/willamin) - creator and maintainer
