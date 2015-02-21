var express = require('express')
var app = express();
var bodyParser = require('body-parser');

var mongoose = require('mongoose');
var Schema = mongoose.Schema;
mongoose.connect('mongodb://grantbot:circle12345@ds045521.mongolab.com:45521/govwiki');

var db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error:'));

var govSchema = new Schema({ name: String }, {collection: 'govs'});

var Gov = mongoose.model('Gov', govSchema);


app.set('port', (process.env.PORT || 5000));
app.use(bodyParser.json());
app.use(express.static(__dirname + '/public'));

app.get('/', function(req, res) {
  res.status(200).send('hello world');
})

app.post('/', function (req, res) {
  //Parse state and gov type

  Gov.find({ 
    state: 'NY', 
    gov_type: 'BLAH' 
  }, function (err, govs) {
    if (err) { 
      console.log(err);
      res.status(304).send('Pooped the bed');
    } else {
      res.status(200).send(govs);
    }
  });
})

app.listen(app.get('port'), function() {
  console.log("Node app is running at localhost:" + app.get('port'))
})
