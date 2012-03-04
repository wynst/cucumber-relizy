module Cucumber
  module Relizy
    # Your code goes here...
    module CLI
      def self.execute(filename)
        doc = Nokogiri::HTML File.read(filename)

        a = doc.css("#cucumber-relizy")
        if a && a.size>0
          a.remove
        end

        script = File.expand_path('../assets/cucumber-relizy.css', __FILE__)
        script = File.read(script)
        a = doc.css("body").first
        a.add_child("<style type='text/css'>\n#{ script }\n</style>")

        script = File.expand_path('../assets/cucumber-relizy.js.coffee', __FILE__)
        script = CoffeeScript.compile File.read(script)
        a = doc.css("body").first
        a.add_child("<script type='text/javascript' id='cucumber-relizy'>\n#{ script }\n</script>")

        output = filename.gsub(/html$/, 'relizy.html')
        File.open(output,"w+") do |f|
          doc.write_to f
        end
      end
    end
  end
end



