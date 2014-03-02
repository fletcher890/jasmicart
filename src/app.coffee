define ['libs/jquery/dist/jquery.js', 'src/basket.js', 'src/item.js'], ($, Basket, Item) ->
	$ = jQuery

	basket = new Basket()
	laptop = new Item(1, 'Laptop', 400)
	mouse = new Item(2, 'mouse', 40)

	updateBasket =  ->
		$('.basketTable tbody').html('')
		
		total = basket.totalPrice()
		discountAmount = basket.getDiscountInMonetryValue()
		
		for item in basket.items
			$('.basketTable tbody').append("<tr data-item='#{item.item.id}'><td>#{item.item.title}</td><td>#{item.quantity}</td><td>$#{item.item.price * item.quantity}</td><td><i style='cursor:pointer;' class='removeItem glyphicon glyphicon-remove'></i></tr>")
		
		if basket.items.length > 0

			if basket.discountAmount > 0
				$('.basketTable tbody').append("<tr><td colspan='2'><small>Discount</small></td><td>- $#{discountAmount.toFixed(2)}</td><td colspan='1'></td></tr>");

			$('.basketTable tbody').append("<tr><td colspan='2'><small>Total</small></td><td>$#{total.toFixed(2)}</td><td colspan='1'></td></tr>");
			$('#discountWrapper').show()
			$('.basketTable').show()

		else
			$('.basketTable').hide()
			$('#discountWrapper').hide()


	$('.addToBasket').bind 'click', -> 
		item = if $(@).attr('data-pid') is '1' then laptop else mouse
		basket.add item, parseInt($(@).parent().parent().find('input').val())
		updateBasket()
		@

	$('body').on 'click', '.removeItem', -> 
		item = if $(@).parent().parent().attr('data-item') is '1' then laptop else mouse
		basket.remove item
		updateBasket()
		@

	$('.discountCode').bind 'click', ->
		basket.addCoupon($("#code").val())
		updateBasket()
		$("#code").val('')
		@