require "json"
require "http/client"

class AwesomeApi
  def initialize
    @headers = HTTP::Headers {
      "Content-Type" => "application/json",
      "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36"
    }
    uri = URI.parse("https://economia.awesomeapi.com.br")
    @http_client = HTTP::Client.new(uri)
  end

  def get_last_quotation(currency : String) : JSON::Any
    JSON.parse(
      @http_client.get("/json/last/#{currency}", headers: @headers).body)
  end

  def get_days_quotation(
      currency : String, number_of_days : Int32) : JSON::Any
    JSON.parse(
      @http_client.get("/json/daily/#{currency}/#{number_of_days}", headers: @headers).body)
  end

  def get_sequential_quotations(
      currency : String, amount : Int32) : JSON::Any
    JSON.parse(
      @http_client.get("/#{currency}/#{amount}", headers: @headers).body)
  end
end
