MovementComponent = require '../lib/MovementComponent.coffee'

# @runtime noflo-nodejs

class MoveDown extends MovementComponent
  constructor: ->
    super 'down', 'move down'
exports.getComponent = -> new MoveDown
