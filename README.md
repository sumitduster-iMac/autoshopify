# Autoshopify

A PHP-based application for automating Shopify checkout processes with support for proxy rotation, user-agent randomization, and robust error handling.

## Features

- **Automated Checkout**: Automates the Shopify checkout flow from product selection to payment
- **Proxy Support**: Built-in proxy rotation for reliable request handling
- **User Agent Generation**: Generates authentic user agents for various platforms (Windows, Linux, Mac, Android, iOS)
- **Address Generation**: Random US address generation for testing
- **Phone Number Generation**: Random US phone number generation with authentic area codes
- **CAPTCHA Handling**: Retry mechanism for CAPTCHA challenges
- **Docker Support**: Easy deployment with Docker and Nginx

## Requirements

- PHP 8.2 or higher
- PHP cURL extension
- Nginx (for production deployment)
- Docker (optional, for containerized deployment)

## Installation

### Docker Installation

1. Clone the repository:
```bash
git clone https://github.com/sumitduster-iMac/Autoshopify.git
cd Autoshopify
```

2. Build the Docker image:
```bash
docker build -t autoshopify .
```

3. Run the container:
```bash
docker run -d -p 80:80 autoshopify
```

### Manual Installation

1. Clone the repository:
```bash
git clone https://github.com/sumitduster-iMac/Autoshopify.git
cd Autoshopify
```

2. Configure your web server to point to the repository directory

3. Ensure PHP 8.2+ with cURL extension is installed

## Usage

### API Endpoint

The application exposes a single endpoint that accepts GET parameters:

```
GET /index.php?cc=CARD_NUMBER|MONTH|YEAR|CVV&site=SHOPIFY_SITE_URL
```

**Parameters:**
- `cc`: Credit card details in the format `NUMBER|MONTH|YEAR|CVV`
- `site`: The Shopify store URL to test

**Example:**
```
http://localhost/index.php?cc=4242424242424242|12|25|123&site=https://example-shop.myshopify.com
```

**Response:**
```json
{
    "Response": "SUCCESS",
    "Price": "10.00",
    "Gateway": "shopify_payments",
    "cc": "4242424242424242|12|25|123"
}
```

## File Structure

- **index.php**: Main application entry point
- **ua.php**: User Agent generation class for various platforms
- **usaddress.php**: US address data for random address generation
- **genphone.php**: Phone number generation with authentic area codes
- **nginx.conf**: Nginx configuration for production deployment
- **Dockerfile**: Docker container configuration

## Components

### User Agent Generator (ua.php)

Generates authentic user agents for:
- Windows (XP through 10.5, 32 & 64-bit)
- Linux (various distributions)
- Mac OS X (7 through 10.12)
- Android devices (versions 4.3-7.1)
- iOS devices (iPhone, iPad, iPod)

Supports browsers:
- Chrome
- Firefox
- Internet Explorer

### Address Generator (usaddress.php)

Provides a collection of 39 authentic US addresses across various states and cities.

### Phone Number Generator (genphone.php)

Generates random US phone numbers with authentic area codes from 16 major US metropolitan areas.

## Configuration

### Proxy Configuration

Edit the proxy settings in `index.php`:

```php
$proxy_list = [
    "YOUR_PROXY_IP:PORT",
];
$proxy_auth = "USERNAME:PASSWORD";
```

### Retry Configuration

Adjust the maximum retry attempts in `index.php`:

```php
$maxRetries = 10;
```

## Security Notes

⚠️ **Important**: This application is for educational and testing purposes only. 

- Contains hardcoded proxy credentials that should be replaced
- Includes credit card processing logic that should be secured
- Should not be used in production without proper security audits
- Ensure compliance with applicable laws and regulations

## Docker Details

The Docker container:
- Uses PHP 8.2-FPM
- Includes Nginx web server
- Exposes port 80
- Automatically starts both PHP-FPM and Nginx services

## Error Handling

The application handles various error scenarios:
- Missing or invalid parameters
- Product fetch failures
- Checkout URL not found
- Session token expiry
- Card tokenization failures
- CAPTCHA challenges (with retry mechanism)

## License

See the [LICENSE](LICENSE) file for license information.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Disclaimer

This software is provided for educational purposes only. The authors and contributors are not responsible for any misuse or damage caused by this software. Use at your own risk and ensure compliance with all applicable laws and regulations.