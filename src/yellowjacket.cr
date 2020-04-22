require "yaml"
require "json"

module Yellowjacket
  VERSION = "0.1.0"
end

class String
  def parse_as_yaml()
    YAML.parse(self)
  end

  def puts(io : IO = STDOUT)
    io.puts(self)
  end

  def strip_yaml_comments
    self
      .lines
      .map { |line|
        line =~ /\w*--.*/ ? "" : line
      }
      .join("\n")
  end
end

case ARGV.size
when 0
  if STDIN.tty?
    "Yellow Jacket accepts YAML from STDIN if no arguments are provided."
    .puts(STDERR)
  end
  STDIN.gets_to_end
when 1 then File.read(ARGV[0])
else
  "usage: #{PROGRAM_NAME} [FILENAME]".puts(STDERR)
  exit(1)
end
  .strip_yaml_comments
  .parse_as_yaml
  .to_json
  .puts(STDOUT)
