/*!
  Basic example usage of `mongoose-pagination`
  Querying for `all` {} items in `MyModel`
  Paginating by second page, 10 items per page (10 results, page 2)
 */

var paginate = require('mongoose-paginate');

MyModel.paginate({}, 2, 10, function(error, pageCount, paginatedResults) {
  if (error) {
    console.error(error);
  } else {
    console.log('Pages:', pageCount);
    console.log(paginatedResults);
  }
}