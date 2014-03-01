define ['src/basket', 'src/item'], (Basket, Item) ->
	describe 'Basket', ->

	  basket = laptop = mouse = undefined

	  beforeEach ->
		basket = new Basket()
		laptop = new Item(1, 'Laptop', 400)
		mouse = new Item(2, 'Mouse', 30)
		
		describe 'Adding to basket', ->
	    
			it 'should keep track of distinct items and quantities in basket', ->

				basket.add laptop

				expect(basket.totalCount).toEqual 1
				expect(basket.distinctCount).toEqual 1

				basket.add laptop

				expect(basket.totalCount).toEqual 2
				expect(basket.distinctCount).toEqual 1

				basket.add mouse

				expect(basket.totalCount).toEqual 3
				expect(basket.distinctCount).toEqual 2 


		describe 'emptying a basket', ->

			it 'empties a basket with items in', ->

				basket.add laptop
				basket.empty()

				expect(basket.items.length).toEqual 0

			it 'updates count variables', ->

				basket.add laptop
				basket.empty()

				expect(basket.distinctCount).toEqual 0
				expect(basket.totalCount).toEqual 0

		describe 'finding an item in a basket', ->

			it 'returns true if exists', ->

				basket.add laptop
				expect(basket.itemExistsInBasket(laptop)).toBeTruthy()

		describe 'fetching item from basket', ->
			it 'returns the item object if it exists', ->
				basket.empty()
				basket.add laptop
				result = basket.getItemFromBasket laptop
				expect(result.item).toEqual laptop
				expect(result.quantity).toEqual 1

			it 'returns false if the item is not in basket', ->
				basket.empty()
				expect(basket.getItemFromBasket(laptop)).toBeFalsy() 


