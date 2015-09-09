###
Wraps around async.queue
###
module.exports = class Queue

  constructor: () ->
    @queue = async.queue (task, next) =>
        log.info {event: 'queue.task.init', next: next}
        async.ensureAsync(@process.bind(@))(task, next)


  # Pushes tasks onto the queue.
  push: (tasks) ->
    log.info {event: 'queue.push'}
    @queue.push tasks


  # # Processes a task.
  # process: (task, next) ->
  #   task.call(@, next)
