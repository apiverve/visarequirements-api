# Visa Requirements API - Ruby Gem

Visa Requirements tells you what a passport holder needs to enter another country: no visa, an electronic travel authorization, an eVisa, a visa on arrival, a visa arranged in advance, or entry restricted. It also returns the allowed stay in days where one is set. Paid plans can list every destination for one passport.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_visarequirements'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_visarequirements
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_visarequirements'

# Initialize the client
client = APIVerve::Visarequirements::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  passport: "US",
  destination: "JP"
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ passport: "US", destination: "JP" })
  puts response["data"]
rescue APIVerve::Visarequirements::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Visarequirements::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Visarequirements::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "passport": "US",
    "passportName": "United States",
    "destination": "JP",
    "destinationName": "Japan",
    "requirement": "visa_free",
    "requirementLabel": "Visa not required",
    "visaRequiredInAdvance": false,
    "allowedStayDays": 90,
    "allowedStay": "90 days",
    "updatedAt": "2026-10-22T09:00:00.000Z"
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/visarequirements?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/visarequirements?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/visarequirements?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
