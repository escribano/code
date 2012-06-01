https://github.com/LearnBoost/mongoose/issues/609


model.collection.find({}, callback)

Model.find(query, { timeout: 999999 }, callback)

var mongodb = require('mongodb');
var server = new mongodb.Server("127.0.0.1", 27017, {});
new mongodb.Db('test', server, {}).open(function (error, client) {
  if (error) throw error;
  var collection = new mongodb.Collection(client, 'test_collection');
  collection.find({}, {limit:10}).toArray(function(err, docs) {
    console.dir(docs);
  });
});

http://stackoverflow.com/questions/10114257/mongoose-how-can-i-update-documents-with-array-values-matching-one-item-in-the/10119185#10119185

http://stackoverflow.com/questions/10246004/mongoose-mongodb-remove-embedded-document/10246910#10246910

http://stackoverflow.com/questions/5861134/how-to-execute-runcommand-with-mongoose

http://stackoverflow.com/questions/7334390/has-mongoose-support-findandmodify-mongodb-method

https://github.com/LearnBoost/mongoose/blob/7ae5a82352f5239316ceba49fabd5f8337cc30cd/test/model.ref.test.js#L513-549

https://github.com/LearnBoost/mongoose/issues/601

https://groups.google.com/forum/#!msg/mongoose-orm/qs4g-VOwWV0/q090y7lICiMJ

Calling populate on embedded doc of embedded doc
https://github.com/LearnBoost/mongoose/issues/601#issuecomment-3088564