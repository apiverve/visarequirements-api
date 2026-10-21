# Visa Requirements API - PHP Package

Visa Requirements tells you what a passport holder needs to enter another country: no visa, an electronic travel authorization, an eVisa, a visa on arrival, a visa arranged in advance, or entry restricted. It also returns the allowed stay in days where one is set. Paid plans can list every destination for one passport.

## Installation

Install via Composer:

```bash
composer require apiverve/visarequirements
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Visarequirements\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'passport' => 'US',
    'destination' => 'JP'
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Visarequirements\Client;
use APIVerve\Visarequirements\Exceptions\APIException;
use APIVerve\Visarequirements\Exceptions\ValidationException;

try {
    $response = $client->execute(['passport' => 'US', 'destination' => 'JP']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/visarequirements?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/visarequirements?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/visarequirements?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
