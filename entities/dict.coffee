# _ = require 'underscore' from teascript
Type = require './type'

class Dict

  constructor: (@keys, @values) ->

  # toString: ->
  #   '{' + _.zip(@keys, @values).map((val) ->
  #     "#{val[0].lexeme}: #{val[1]}"
  #   ).join(', ') + '}'

  # analyze: (context) ->
  #   value.analyze(context) for value in @values
  #   @type = Type.MAP

  # length: ->
  #   console.log @keys.length
  #   @keys.length

  optimize: ->
    #DEEG

module.exports = Dict