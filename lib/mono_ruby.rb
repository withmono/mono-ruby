# frozen_string_literal: true
require_relative "mono_ruby/version"
require 'httparty'

module MonoRuby

  class Mono
    include HTTParty
    base_uri 'https://api.withmono.com'

    def initialize(data)
        @options = { headers: { "Content-Type": "application/json", "mono-sec-key": data["secretKey"] } }
    end

    def getWalletBalance
        self.class.get("/users/stats/wallet", @options)
    end

    def getAccountId(data)
        self.class.post("/account/auth", @options.merge!( body: {code: data["code"]}.to_json ))
    end
    
    def getAccountInformation(data)
        self.class.get("/accounts/#{data["accountId"]}", @options)
    end

    def getAccountStatement(data)
        query = "?"
        query += data["period"] ? "period=#{data["period"]}&" : ''
        query += data["output"] ? "output=#{data["output"]}&" : ''
        
        self.class.get("/accounts/#{data["accountId"]}/statement#{query}", @options)
    end

    def pollPdfAccountStatementStatus(data)
        self.class.get("/accounts/#{data["accountId"]}/statement/jobs/#{data["jobId"]}", @options)
    end

    def getAccountTransactions(data)
        query = "?"
        query += data["start"] ? "start=#{data["start"]}&" : ''
        query += data["end"] ? "end=#{data["end"]}&" : ''
        query += data["narration"] ? "narration=#{data["narration"]}&" : ''
        query += data["type"] ? "type=#{data["type"]}&" : '';
        query += (!data["paginate"] && data["paginate"] === false) ? "paginate=false&" : "paginate=true&"
        query += data["limit"] ? "limit=#{data["limit"]}&" : ''
        
        self.class.get("/accounts/#{data["accountId"]}/transactions#{query}", @options)
    end

    def getIncome(data)
        self.class.get("/accounts/#{data["accountId"]}/income", @options)
    end

    def getIdentity(data)
        self.class.get("/accounts/#{data["accountId"]}/identity", @options)
    end
    
    def syncDataManually(data)
        self.class.post("/accounts/#{data["accountId"]}/sync", @options)
    end

    def reauthCode(data)
        self.class.post("/accounts/#{data["accountId"]}/reauthorise", @options)
    end

    def getInstitutions
        self.class.get("/coverage", @options)
    end

    def unlinkAccount(data)
        self.class.post("/accounts/#{data["accountId"]}/unlink", @options)
    end

  end

end