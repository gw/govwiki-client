var mongoose = require('mongoose');
var Schema = mongoose.Schema;
mongoose.connect('mongodb://grantbot:circle12345@ds045521.mongolab.com:45521/govwiki');

var db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error:'));

db.once('open', function (callback) {
  var govSchema = new Schema({ name: String }, {collection: 'govs'});

  var Gov = mongoose.model('Gov', govSchema);

  Gov.findOne(function (err, res) {
    if (err) { throw err; }
    console.log(res);
  });
});
