# MonoRuby

Mono-Node is a Ruby wrapper for <a href="https://mono.co"> Mono </a>  
For complete information about the API, head to the <a href="https://docs.mono.co/reference">docs</a>.
<br /><br />

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mono_ruby'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install mono_ruby

## Getting Started

- Register on <a href="https://app.withmono.com/dashboard"> Mono </a>  website and get your Authorization key.
- Setup your mono connect with your mono public key.

<br/>


## Set Secret Key
```ruby
monoClient = MonoRuby::Mono.new({
  "secretKey" => "live_sk_xxxxx"
})
```


## Features

- Wallet Balance
- Get Account ID. from Auth Code.
- Account Information
- Account Statement
- Poll Account Statement PDF
- Transactions
- Income Information
- Identity
- Sync Data
- Re-auth Code
- Institutions
- Account Unlink
<br /><br />
# Implementation

### - Get Wallet Balance
This resource allows you to check the available balance in your Mono wallet

```ruby
walletBalance = monoClient.getWalletBalance
```

<br />

### - Get Account Id from token
This resource returns the account id (that identifies the authenticated account) after successful enrolment on the Mono connect widget.
```ruby
accountIdGet = monoClient.getAccountId({"code" => "code_ir9FIYb5HvNcb1tVe9Dp"})
```

<br />

### - Get Account Information
This resource returns the account details with the financial institution.

```ruby
accountInfo = monoClient.getAccountInformation({"accountId" => accountId})
```

<br />

### - Get Account Statement in JSON
This resource returns the bank statement of the connected financial account in JSON.  
You can query 1-12 months bank statement in one single call.
```ruby
accountStatement = monoClient.getAccountStatement({
    "accountId" => "6094b18f7f87041b24cb8bc1",
    "period" => "last2months",
    "output" => "json"
})
```

<br />


### - Get Account Statement in PDF
This resource returns the bank statement of the connected financial account in PDF.  
You can query 1-12 months bank statement in one single call.
```ruby
accountStatement = monoClient.getAccountStatement({
    "accountId" => "6094b18f7f87041b24cb8bc1",
    "period" => "last2months",
    "output" => "pdf"
})
```

<br />


### - Poll Account Statement in PDF
With this resource, you set the output as PDF, and you can use this endpoint to poll the status
```ruby
pollAccountStatement = monoClient.pollPdfAccountStatementStatus({
    "accountId" => "6094b18f7f87041b24cb8bc1",
    "jobId" => "EqCjlqWoxWu2AgRsMSxX"
})
```

<br />

### - Get Account Transactions
This resource returns the known transactions on the account.

```ruby
accountTransactions = monoClient.getAccountTransactions({
    "accountId" => "6094b18f7f87041b24cb8bc1",
    "paginate" => true,
    "limit" => 10
})
```

<br />


### - Get Income Information
This resource will return income information on the account.
```ruby
accountIncome = monoClient.getIncome({"accountId" => "6094b18f7f87041b24cb8bc1"})
```

<br />


### - Get Account Identity
This resource returns a high level overview of an account identity data.
```ruby
identity = monoClient.getIdentity({"accountId" => "6094b18f7f87041b24cb8bc1"})
```

<br />


### - Synchronise Data
This resource attempts to Sync data manually.
```ruby
dataSync = monoClient.syncDataManually({"accountId" => "6094b18f7f87041b24cb8bc1"})
```

<br />


### - Get Re-auth Code. 
This resource returns a Re-auth code which is a mono generated code for the account you want to re-authenticate,
```ruby
reCode = monoClient.reauthCode({"accountId" => "6094b18f7f87041b24cb8bc1"})
```

<br />


### - Get Financial Institutions
This resource returns the available institutions on Mono
```ruby
institutions = monoClient.getInstitutions
```

<br />

### - Unlink Account
This resource provides your customers with the option to unlink their financial account(s)
```ruby
unlink = monoClient.unlinkAccount({"accountId" => "6094b18f7f87041b24cb8bc1"})
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mono_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/mono_ruby/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MonoRuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/mono_ruby/blob/master/CODE_OF_CONDUCT.md).
