require 'singleton'

module HerokuLogParser
  class Parser
    include Singleton

    def parse_line(line)
      matches = line.match(/^(.*?)\s(.*)\[(.*)\]\:\s(.*)$/)
      
      JSON.generate({
        timestamp: matches[1],
        source: matches[2],
        process: matches[3],
        message: matches[4]
      })
    end


    def parse(text)
      parse_line(text) 
    end

    class << self
      def parse(text)
        instance.parse(text)
      end
    end

  end
end
