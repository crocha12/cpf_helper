# CpfHelper

CpfHelper is a Ruby gem for validating and generating Brazilian CPF numbers.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add cpf_helper

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install cpf_helper

## Usage

To validate a CPF number:

```ruby
require 'cpf_helper'

CpfHelper.valid?('875.200.930-00') # => true or false
```

To mask a CPF number:

if the CPF number is valid, it will return a masked version of the CPF number, otherwise it will return nil.

```ruby
require 'cpf_helper'
masked_cpf = CpfHelper.mask('87520093000') # => '875.***.***-00'
```

To format a CPF number:

if the CPF number is valid, it will return a formatted version of the CPF number, otherwise it will return nil.

```ruby
require 'cpf_helper'
formatted_cpf = CpfHelper.format('87520093000') # => '875.200.930-00'
```

To clean a CPF number (remove formatting):

if the CPF number is valid, it will return a cleaned version of the CPF number, otherwise it will return nil.

```ruby
require 'cpf_helper'
cleaned_cpf = CpfHelper.clean('875.200.930-00') # => '87520093000'
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/your-username/cpf_helper.

## License

This project is licensed under the MIT License.