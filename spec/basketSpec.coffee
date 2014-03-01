define ['src/basket', 'src/item'], (Basket, Item) ->
	describe 'Basket', ->

		it 'should be defined', ->
		  expect(Basket).toBeDefined()
		  expect(Item).toBeDefined()

	  it 'should keep track of items in basket', ->
	    
	    basket = new Basket()
	    item = new Item()

	    basket.add item

	    expect(basket.itemCount).toEqual 1

	    basket.add item

	    expect(basket.itemCount).toEqual 2