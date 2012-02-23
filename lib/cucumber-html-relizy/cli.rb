module Cucumber
  module Html
    module Relizy
      # Your code goes here...
      module CLI
        def self.execute(filename)
          doc = Nokogiri::HTML File.read(filename)

          a = doc.css("#cucumber-relizy")
          if a && a.size>0
            a.remove
          end

          script = File.expand_path('../js/cucumber-html-relizy.js.coffee', __FILE__)
          script = CoffeeScript.compile File.read(script)
          a = doc.css("body").first
          a.add_child("<script type='text/javascript' id='cucumber-relizy'>#{ script }</script>")

          output = filename.gsub(/html$/, 'relizy.html')
          File.open(output,"w+") do |f|
            doc.write_to f
          end
        end
      end
    end
  end
end



