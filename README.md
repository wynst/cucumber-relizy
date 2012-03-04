# Cucumber::Relizy

Patch existing cucumber html output with navigation for features

Before:

![cucumber](https://github.com/wynst/cucumber-relizy/raw/master/doc/cucumber.jpg)

After:
![cucumber-html](https://github.com/wynst/cucumber-relizy/raw/master/doc/cucumber-relizy.jpg)


## Installation

    $ gem install cucumber-relizy

## Usage

1. command-line  
  `cucumber-relizy FILENAME`  
   will create `FILENAME.relizy.html`

2. thor task  
   * add this to your Thorfile in a Rails app

```ruby
class App < Thor
  desc "features", "run cucumber and browse features"
  def features
    system "rm tmp/features.html"
    system "rm tmp/features.relizy.html"
    system "bundle exec cucumber --drb features/ --format=html -o tmp/features.html"
    system "cucumber-relizy tmp/features.html"
    system "open tmp/features.relizy.html"
  end
end
```

   * run `thor app:features` to run cucumber, and browse the features.

## Similar library
   * [http://relishapp.com](Relish) : this library is inspired by Relish
     feature navigation.

