# Mono Ruby Library

The Mono Ruby library provides convenient access to the Mono API from
applications written in Ruby.

For connecting customer accounts in the browser or an app, use the [Mono Connect Widget](https://github.com/withmono/connect.js).

## Documentation

For complete information about the API, head to the [docs](https://docs.mono.co/reference/documentation-intro).


## Getting Started

1. Register on the [Mono](https://app.withmono.com/dashboard) website and get your public and secret keys.
2. Setup your [Mono Connect Widget](https://docs.mono.co/docs/intro-to-mono-connect-widget) with your Mono public key.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mono_ruby'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install mono_ruby

## Usage

The package needs to be configured with your account's `secretKey`, which is
available in the [Mono Dashboard](https://app.withmono.com/apps).

```ruby
monoClient = MonoRuby::Mono.new({
  "secretKey" => "live_sk_..."
})
```

## Features

- [Wallet Balance](#wallet)
- [Get Account ID from Auth Code](#account_id)
- [Unlink Account](#unlink)
- [Account Information](#info)
- [Account Statement](#statement)
- [Poll Account Statement PDF](#statement_pdf)
- [Transactions](#transactions)
- [Credits](#credits)
- [Debits](#debits)
- [Income Information](#income)
- [Identity](#identity)
- [Sync Data](#sync)
- [Re-auth Code](#reauth)
- [Institutions](#institutions)

# Implementation

## Methods

Once an instance of the client has been created you use the following methods:


### <a name="wallet"></a>Get Wallet Balance
This resource allows you to check the available balance in your Mono wallet

```ruby
walletBalance = monoClient.getWalletBalance
```



### <a name="account_id"></a>Get Account Id from token
This resource returns the account id (that identifies the authenticated account) after successful enrolment on the Mono Connect Widget.
```ruby
accountIdGet = monoClient.getAccountId({"code" => "code_ir9FIYb5HvNcb1tVe9Dp"})
```


### <a name="unlink"></a>Unlink Account
This resource provides your customers with the option to unlink their financial account(s)
```ruby
unlink = monoClient.unlinkAccount({"accountId" => "6094b18f7f87041b24cb8bc1"})
```

### <a name="info"></a>Get Account Information
This resource returns the account details with the financial institution.


```ruby
accountInfo = monoClient.getAccountInformation({"accountId" => accountId})
```

### <a name="statement"></a>Get Account Statement in JSON
This resource returns the bank statement of the connected financial account in JSON.  
You can query 1-12 months bank statement in one single call.
```ruby
accountStatement = monoClient.getAccountStatement({
    "accountId" => "6094b18f7f87041b24cb8bc1",
    "period" => "last2months",
    "output" => "json"
})
```

### Get Account Statement in PDF
This resource returns the bank statement of the connected financial account in PDF.  
You can query 1-12 months bank statement in one single call.
```ruby
accountStatement = monoClient.getAccountStatement({
    "accountId" => "6094b18f7f87041b24cb8bc1",
    "period" => "last2months",
    "output" => "pdf"
})
```

### <a name="statement_pdf"></a>Poll Account Statement in PDF
With this resource, you set the output as PDF, and you can use this endpoint to poll the status
```ruby
pollAccountStatement = monoClient.pollPdfAccountStatementStatus({
    "accountId" => "6094b18f7f87041b24cb8bc1",
    "jobId" => "EqCjlqWoxWu2AgRsMSxX"
})
```

### <a name="transactions"></a>Get Account Transactions
This resource returns the known transactions on the account.
```ruby
accountTransactions = monoClient.getAccountTransactions({
    "accountId" => "6094b18f7f87041b24cb8bc1",
    "paginate" => true,
    "limit" => 10
})
```

### <a name="credits"></a>Get Customer's Credits
This resource returns the historical credits on the account
```ruby
customerCredits = monoClient.getCredits({"accountId" => "6094b18f7f87041b24cb8bc1"})
```

### <a name="debits"></a>Get Customer's Debits
This resource returns the historical debits on the account
```ruby
customerDebits = monoClient.getDebits({"accountId" => "6094b18f7f87041b24cb8bc1"})
```

### <a name="income"></a>Get Income Information
This resource will return income information on the account.
```ruby
accountIncome = monoClient.getIncome({"accountId" => "6094b18f7f87041b24cb8bc1"})
```
**Note:** This is a number estimated by Mono. It is not nesecarrily 100% correct, however, a confidence interval is provided to show the estimations accuracy.

### <a name="identity"></a>Get Account Identity
This resource returns a high level overview of an account identity data.
```ruby
identity = monoClient.getIdentity({"accountId" => "6094b18f7f87041b24cb8bc1"})
```

**Note:** Not all banks return identity information. [See Coverage](https://docs.mono.co/docs/bvn-coverage)

### <a name="sync"></a>Synchronise Data
This resource attempts to Sync data manually.
```ruby
dataSync = monoClient.syncDataManually({"accountId" => "6094b18f7f87041b24cb8bc1"})
```
**Note:** This may require some users to re-authorize their bank account with Mono. [See Re-authorization](https://docs.mono.co/reference/intro#reauthorisation)

### <a name="reauth"></a>Get Re-auth Code.
This resource returns a Re-auth code which is a mono generated code for the account you want to re-authenticate,
```ruby
reCode = monoClient.reauthCode({"accountId" => "6094b18f7f87041b24cb8bc1"})
```

### <a name="institutions"></a>Get Financial Institutions
This resource returns the available institutions on Mono
```ruby
institutions = monoClient.getInstitutions
```

## Support
If you're having general trouble with Mono Ruby or your Mono integration, please reach out to us at <hi@mono.co> or come chat with us on Slack. We're proud of our level of service, and we're more than happy to help you out with your integration to Mono.

## Contributing
If you would like to contribute to the Mono Ruby Library, please make sure to read our [contributor guidelines](https://github.com/withmono/mono-ruby/tree/master/CONTRIBUTING.md).


## License

[MIT](https://github.com/withmono/mono-ruby/blob/master/LICENSE) for more information.
