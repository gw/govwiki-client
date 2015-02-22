# govwiki-client

Map ALL the govs!

### Usage

...

### Development Environment

Get access to the [govwiki mongo database](https://mongolab.com/databases/govwiki).

[Install](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-os-x/) Mongodb.

```` sh
brew update
brew install mongodb
````

Connect to the mongo database.

```` sh
mongo ds045521.mongolab.com:45521/govwiki -u GOVWIKI_MONGOLAB_USERNAME -p
````

Install Node.

```` sh
brew install node
````

Initialize new node project.

```` sh
cd /path/to/govwiki-client
npm init
```

Install Mongoose into the project folder.

```` sh
cd /path/to/govwiki-client
npm install mongoose --save
````

Add an index.js file to the project root directory, and run via node.

```` sh
cd /path/to/govwiki-client
node index.js
````

Install server.

```` sh
npm install -g nodemon
npm install # to install express?
````

Run server.

```` sh
cd path/to/govwiki-client/
nodemon index.js
````

Next Steps:

Geocode all the govs.
 + Create Mapquest API Key http://developer.mapquest.com/web/info/account/app-keys ... #fail
