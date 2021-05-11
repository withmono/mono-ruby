# frozen_string_literal: true

monoClient = MonoRuby::Mono.new({
  "secretKey" => "live_sk_xxxxx"
})

accountId = "6094b18f7f87041b24cb8bc1"

RSpec.describe MonoRuby do
  it "has a version number" do
    expect(MonoRuby::VERSION).not_to be nil
  end

  it "Testing walletBalance Api" do
    walletBalance = monoClient.getWalletBalance
    expect(walletBalance).to be_truthy(true)
  end

  it "Testing getAccountId Api" do
    accountIdGet = monoClient.getAccountId({"code" => "code_ir9FIYb5HvNcb1tVe9Dp"})
    expect(accountIdGet).to be_truthy(true)
  end

  it "Testing getAccountInformation Api" do
    accountInfo = monoClient.getAccountInformation({"accountId" => accountId})
    expect(accountInfo).to be_truthy(true)
  end

  it "Testing getAccountStatement Api" do
    accountStatement = monoClient.getAccountStatement({"accountId" => accountId, "period" => "last2months", "output" => "json"})
    expect(accountStatement).to be_truthy(true)
  end

  it "Testing pollAccountStatementPdf Api" do
    pollAccountStatement = monoClient.pollPdfAccountStatementStatus({"accountId" => accountId, "jobId" => "EqCjlqWoxWu2AgRsMSxX"})
    expect(pollAccountStatement).to be_truthy(true)
  end

  it "Testing getAccountTransactions Api" do
    accountTransactions = monoClient.getAccountTransactions({"accountId" => accountId, "paginate" => true, "limit" => 10})
    expect(accountTransactions).to be_truthy(true)
  end

  it "Testing getIncomeInformation Api" do
    accountIncome = monoClient.getIncome({"accountId" => accountId})
    expect(accountIncome).to be_truthy(true)
  end

  it "Testing getIdentity Api" do
    identity = monoClient.getIdentity({"accountId" => accountId})
    expect(identity).to be_truthy(true)
  end

  it "Testing syncDataManually Api" do
    dataSync = monoClient.syncDataManually({"accountId" => accountId})
    expect(dataSync).to be_truthy(true)
  end

  it "Testing getReauthCode Api" do
    reCode = monoClient.reauthCode({"accountId" => accountId})
    expect(reCode).to be_truthy(true)
  end

  it "Testing getInstitutions Api" do
    institutions = monoClient.getInstitutions
    expect(institutions).to be_truthy(true)
  end

  it "Testing unlinkAccount Api" do
    unlink = monoClient.unlinkAccount({"accountId" => accountId})
    expect(unlink).to be_truthy(true)
  end

end