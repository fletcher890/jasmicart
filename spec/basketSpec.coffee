define ['src/basket', 'src/item'], (Basket, Item) ->
	describe 'Basket', ->

		it 'should be defined', ->
		  expect(Basket).toBeDefined()
		  expect(Item).toBeDefined()

	  it 'should keep track of distinct items and quantities in basket', ->
	    
	    basket = new Basket()

	    laptop = new Item(1, 'Laptop', 400)
	    mouse = new Item(2, 'Mouse', 30)

	    basket.add laptop

	    expect(basket.totalCount).toEqual 1
	    expect(basket.distinctCount).toEqual 1

	    basket.add laptop

	    expect(basket.totalCount).toEqual 2
	    expect(basket.distinctCount).toEqual 1

	     basket.add mouse

	     expect(basket.totalCount).toEqual 3
	     expect(basket.distinctCount).toEqual 2