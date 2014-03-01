define [], ->
	class Basket

		constructor: ->
			@items =  []
			@distinctCount = 0
			@totalCount = 0

		add: (item, quantity = 1) ->

			if @itemExistsInBasket item
				currentItem = @getItemFromBasket item
				currentItem.quantity += quantity

			else
				@items.push {
					item
					quantity
				}

			@updateCounts()

		remove: (item, qty = 1) ->
			return unless @itemExistsInBasket item

			basketItem = @getItemFromBasket item
			basketItem.quantity -= qty

			if basketItem.quantity < 1
				itemloc = @getItemIndex item
				@items.splice(itemloc, 1)

			@updateCounts()

		updateCounts: ->
			total = 0
			for item in @items
				total += item.quantity

			@distinctCount = @items.length
			@totalCount = total

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

		getQuantity: (item) ->
			if @itemExistsInBasket item
				# quantity
				@getItemFromBasket(item).quantity
			else
				0

		getItemIndex: (item) ->
			count = 0
			for basketItem in @items
				return count if basketItem.item.id is item.id
				count++
			
			-1