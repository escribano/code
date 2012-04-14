###
  Public exported fetcher for fold factory,
  being the only way through which to create folds.
###
class Folds
  _instance = undefined

  # static fetch property method
  @public 'Factory',
    get: -> _instance ?= new _Folds

###
  Encapsuled singleton factory for one-stop fold creation
###
class _Folds
  constructor: ->

  create: -> new Fold