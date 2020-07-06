# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
stock_ready = ->

  $('#stock_warehouse_id').change ->
    $.ajax '/stocks/get_stock',
      type: 'GET'
      datatype: 'JSON'
      data: {product_id: $('#stock_product_id').val(), warehouse_id: $('#stock_warehouse_id').val() }
      error: (jqXHR, textStatus, errorThrown) ->
      success: (data, textStatus, jqXHR) ->
        debugger
        $('#stock_low_item_threshold').val(data.low_item_threshold)
        $('#stock_item_count').val(data.item_count)


$(document).ready(stock_ready)
