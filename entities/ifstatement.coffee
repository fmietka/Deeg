BooleanLiteral = require './booleanliteral.coffee'

class IfStatement

  constructor: (@condition, @body, @elseIfStatement, @elseStatement) ->

  toString: () ->
    "(If #{@condition} then #{@body})"
  # disclaimer: toString will be more complicated because of possible else
  # and else if stuff

  # analyze: (context) ->
  #   @condition.analyze context
  #   booleanCondition = 'Condition in "if" statement must be boolean'
  #   @condition.type.mustBeBoolean booleanCondition
  #   @body.analyze context

  # optimize: () ->
  #   @condition = @condition.optimize()
  #   @body = @body.optimize()
  #   if @condition instanceof BooleanLiteral and @condition.value() is false
  #     return null
  #   return this

module.exports = IfStatement