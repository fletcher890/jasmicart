define ['src/basket', 'src/item'], (Basket, Item) ->
	
	describe 'Item', ->
	  
		item = undefined

		beforeEach ->
			item = new Item 1, 'Mouse', 10

		describe 'updating an item', ->

		  it 'should update properties passed in', ->
		    item.update {

		    	title: "Super Mouse"
		    	price: 10

		    }

		    expect(item.title).toEqual "Super Mouse"
		    expect(item.price).toEqual 10
		    expect(item.id).toEqual 1

		describe 'protected fields', ->

			it 'should have the id as a protected field', ->
				expect(item.protectedFields).toContain "id"
				expect(item.protectedFields.length).toEqual 1

			it 'should let us add a protected field', ->
				item.addProtectedField "title"
				expect(item.protectedFields).toContain "title"
				expect(item.protectedFields.length).toEqual 2

			it 'should not allow protected fields to be updated', ->
			    
			    item.addProtectedField "title"
			    item.update {
			    	id: 2
			    	title: "New Title"
			    	price: 15
			    }

			    expect(item.id).toEqual 1
			    expect(item.title).toEqual "Mouse"
			    expect(item.price).toEqual 15

		describe 'field is protected', ->

			it 'should return true if field is protected', ->

				expect(item.fieldIsProtected("id")).toBeTruthy() 

			it 'should return false if field is not protected', ->

				expect(item.fieldIsProtected("price")).toBeFalsy()

		describe 'getting ratings from a 3rd party API', ->

			beforeEach ->
			  	spyOn(item, 'getRatings').andCallFake ->
			  		JSON.parse('{"ratings":[{"rating":4,"review":"This is a really great product","source":"Amazon"},{"rating":1,"review":"I didnt really like it that much it wasnt very good","source":"PC World"},{"rating":3,"review":"Its pretty average.","source":"Ebay"}]}')
		  
		  	it 'should return the three latest ratings', ->
		  	  	expect(item.getRatings().ratings.length).toEqual 3

		  	it 'parsing an individual score', ->
		  	  	expect(item.getRatings().ratings[0].rating).toEqual 4


		  	 