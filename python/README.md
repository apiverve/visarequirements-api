Visa Requirements API
============

Visa Requirements tells you what a passport holder needs to enter another country: no visa, an electronic travel authorization, an eVisa, a visa on arrival, a visa arranged in advance, or entry restricted. It also returns the allowed stay in days where one is set. Paid plans can list every destination for one passport.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-visarequirements.svg)](https://pypi.org/project/apiverve-visarequirements/)

This is a Python wrapper for the [Visa Requirements API](https://apiverve.com/marketplace/visarequirements?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-visarequirements
```

Using `pip3`:

```bash
pip3 install apiverve-visarequirements
```

---

## Configuration

Before using the Visa Requirements API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_visarequirements.apiClient import VisarequirementsAPIClient

# Initialize the client with your APIVerve API key
api = VisarequirementsAPIClient("[YOUR_API_KEY]")

query = {
    "passport": "US",
    "destination": "JP"
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Visa Requirements API documentation is found here: [https://docs.apiverve.com/ref/visarequirements](https://docs.apiverve.com/ref/visarequirements?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_visarequirements.apiClient import VisarequirementsAPIClient

# Initialize the client with your APIVerve API key
api = VisarequirementsAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "passport": "US",
    "destination": "JP"
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `VisarequirementsAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_visarequirements.apiClient import VisarequirementsAPIClient, VisarequirementsAPIClientError

api = VisarequirementsAPIClient("[YOUR_API_KEY]")

query = {
    "passport": "US",
    "destination": "JP"
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except VisarequirementsAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_visarequirements.apiClient import VisarequirementsAPIClient, VisarequirementsAPIClientError

api = VisarequirementsAPIClient("[YOUR_API_KEY]")

query = {
    "passport": "US",
    "destination": "JP"
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except VisarequirementsAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_visarequirements.apiClient import VisarequirementsAPIClient, VisarequirementsAPIClientError

query = {
    "passport": "US",
    "destination": "JP"
}

# Using context manager ensures proper cleanup
with VisarequirementsAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except VisarequirementsAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_visarequirements.apiClient import VisarequirementsAPIClient

# Enable debug mode
api = VisarequirementsAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "passport": "US",
    "destination": "JP"
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_visarequirements.apiClient import VisarequirementsAPIClient

api = VisarequirementsAPIClient("[YOUR_API_KEY]")

query = {
    "passport": "US",
    "destination": "JP"
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
