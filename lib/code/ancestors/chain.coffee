## chainDeferred

# Take two jQuery Deferred objects and chain one on to the other. So
# anything that happens to the first one is proxied on the second one.
# Returns the source (for method call chaining)

module.chainDeferred = (source, destination) ->
  source.then(
    -> destination.resolveWith(@, arguments),
    -> destination.rejectWith(@, arguments),
    -> destination.notifyWith(@, arguments)
    )
  source


## chainError

# Take two jQuery Deferred objects and forward any erros on the first
# on to the second. Return the source (for method chaining)

module.chainError = (source, destination) ->
  source.fail(-> destination.rejectWith(@,arguments))
  source


fetchRelated: (name) =>
  deferred = jQuery.Deferred()
  utils.chainError(@maybeFetch, deferred).done =>
    obj = @related(name)
    if obj
      utils.chainDeferred(obj.maybeFetch(), deferred)
    else
      deferred.rejectWith(@, ['Link does not exist'])
  return deferred.promise()
