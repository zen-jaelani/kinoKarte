# kinoKarte

Sebuah aplikasi yang dapat digunakan untuk melakukan pemesanan tiket film di bioskop terdekat

## Getting Started

### Prerequisites

- vsCode
- nodejs
- Webserver dan database manager software (e.g. xampp,lamp)
- redis

### Package depedencies

- `express` [[here](https://www.npmjs.com/package/express)]
- `body-parser` [[here](https://www.npmjs.com/package/body-parser)]
- `cors` [[here](https://www.npmjs.com/package/cors)]
- `morgan` [[here](https://www.npmjs.com/package/morgan)]
- `mysql2` [[here](https://www.npmjs.com/package/mysql2)]
- `helmet` [[here](https://www.npmjs.com/package/helmet)]
- `xss-clean` [[here](https://www.npmjs.com/package/xss-clean)]
- `compression` [[here](https://www.npmjs.com/package/compression)]
- `nodemon` [[here](https://www.npmjs.com/package/nodemon)]
- `jsonwebtoken` [[here](https://www.npmjs.com/package/jsonwebtoken)]
- `multer` [[here](https://www.npmjs.com/package/multer)]
- `multer-storage-cloudinary` [[here](https://www.npmjs.com/package/multer-storage-cloudinary)]
- `cloudinary` [[here](https://www.npmjs.com/package/cloudinary)]
- `redis` [[here](https://www.npmjs.com/package/redis)]
- `dotenv`[[here](https://www.npmjs.com/package/dotenv)]
- `nodemailer`[[here](https://www.npmjs.com/package/nodemailer)]
- `bcrypt` [[here](https://www.npmjs.com/package/bcrypt)]
- `mustache` [[here](https://www.npmjs.com/package/mustache)]
- `midtrans-client` [[here](https://www.npmjs.com/package/midtrans-client)]

### Installation

1. Clone repo
   ```sh
   git clone git@github.com:Qxtlp/kinoKarte.git
   ```
2. Buka repository
   ```sh
   cd kinoKarte
   ```
3. Install NPM packages
   ```sh
   npm install
   ```
4. Import database yang ada di dalam local repo bernama kinokarte.sql kedalam mysql

## Set up .env file

```
DBHOST: // Database host
DBUSER: // Database User
DBPASSWORD: // Database Password
DATABASE: // Database name
PORT: // Port used

AUTHMAIL: // email used for sending verification
AUTHPASS: // email password

TOKENSECRET: // secret code used for jwt

CLOUDINARY_NAME: // cloudinary cloud name
CLOUDINARY_API_KEY: // cloudinary api key
CLOUDINARY_API_SECRET: // cloudinary api secret

MIDTRANS_PRODUCTION: // midtrans in production state (true/false)
MIDTRANS_SERVER_KEY: // midtrans server key
MIDTRANS_CLIENT_KEY: // midtrans client key

REDIS_HOST: // Redis host
REDIS_PORT: // Redis port
REDIS_PASSWORD: // Redis password
```
