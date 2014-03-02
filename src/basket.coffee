define [], ->
	class Basket

		constructor: ->
			@items =  []
			@distinctCount = 0
			@totalCount = 0
			@discountAmount = 0
			@coupons = ['A10', 'A25', 'A50']

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

		totalPrice: ->
			price = 0
			for item in @items
				price += item.quantity * item.item.price

			price * (1 - (@discountAmount / 100))

		setDiscount: (amount) ->
			@discountAmount = Math.abs amount

		getDiscountInMonetryValue: ->
			price = 0
			for item in @items
				price += item.quantity * item.item.price

			(price / 100) * @discountAmount

		addCoupon: (code) ->
			if code in @coupons
				@setDiscount(parseInt(code.substring(1)))
				true
			else
				false

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