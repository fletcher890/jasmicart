define [], ->
	class Basket

		constructor: ->
			@items =  []
			@distinctCount = 0
			@totalCount = 0

		add: (item) ->

			if @itemExistsInBasket item
				currentItem = @getItemFromBasket item
				currentItem.quantity++

			else
				@items.push {
					item: item,
					quantity: 1
				}

			@distinctCount = @items.length
			@totalCount++

		empty: ->
			@items = []
			@distinctCount = 0
			@totalCount = 0

		itemExistsInBasket: (item) ->
			for basketItem in @items
				return true if basketItem.item.id  is item.id
			false

		getItemFromBasket: (item) ->
			currentItem = undefined
			for basketItem in @items
				return basketItem if basketItem.item.id is item.id

			false