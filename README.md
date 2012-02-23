# Cucumber::Html::Relizy

Patch your cucumber html output with features navigation

## Installation

    $ gem install cucumber-html-relizy

## Usage

1. command-line
  `cucumber-html-relizy FILENAME`
2. thor task (add this to your Thorfile)

```ruby

desc "run cucumber and browse features"
def features
  `cucumber features/ --format=html --output=tmp/features.html`
  `cucumber-html-relizy tmp/features.html`
  `open tmp/features.relizy.html`
end
```

