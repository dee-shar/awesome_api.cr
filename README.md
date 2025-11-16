# awesome_api.cr
Web-API for [awesomeapi.com.br](https://awesomeapi.com.br/) which provides access to currency exchange rates and financial data

## Example
```cr
require "./awesome_api"

awesome_api = AwesomeApi.new
last_quotation = awesome_api.get_last_quotation(
	currency="usd")
puts last_quotation
```
