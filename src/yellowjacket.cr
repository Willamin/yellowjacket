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

ARGF
  .gets_to_end
  .strip_yaml_comments
  .parse_as_yaml
  .to_json
  .puts(STDOUT)
