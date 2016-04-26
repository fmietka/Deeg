 #  ___________________        ____....-----....____
 # (________________LL_)   ==============================
 #     ______\   \_______.--'.  `---..._____...---'
 #     `-------..__            ` ,/
 #     ___         `-._ -  -  - |
 #    ( /        /     `-------'
 #     / __ (   /_
 #   _/_(_)/_)_/ /_
 #  //
 # (/

Type = require "#{__dirname}/type.coffee"
BooleanLiteral = require "#{__dirname}/./booleanliteral.coffee"

class IfStatement

  constructor: (@condition, @body, @elseIfStatement, @elseStatement) ->

  toString: () ->
    res = "(If #{@condition} then #{@body}"
    if @elseIfStatement
      res += " #{@elseIfStatement}"
    else if @elseStatement
      res += " #{@elseStatement}"
    res += ")"

  analyze: (context) ->
    @condition.analyze context
    booleanCondition = 'Condition in "if" statement must be boolean'
    @condition.type.mustBeBoolean booleanCondition
    @body.analyze context
    if @elseIfStatement
      @elseIfStatement.analyze context
    else if @elseStatement
      @elseStatement.analyze context

  optimize: () ->
    @condition = @condition.optimize()
    @body = @body.optimize()
    if @elseIfStatement
      @elseIfStatement.optimize()
    else if @elseStatement
      @elseStatement.optimize()
    if @condition instanceof BooleanLiteral and @condition.value() is false
      return null
    return this

module.exports = IfStatement