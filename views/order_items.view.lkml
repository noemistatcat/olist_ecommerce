view: order_items {
  view_label: "Order transaction data"
  sql_table_name: "DATASETS"."ORDER_ITEMS"
    ;;
  drill_fields: [order_item_id]

  dimension: order_item_id {
    description: "Sequential number identifying number of items included in the same order."
    primary_key: yes
    type: number
    sql: ${TABLE}."ORDER_ITEM_ID" ;;
  }

  dimension: freight_value {
    description: "Item freight value item (if an order has more than one item the freight value is splitted between items)"
    type: number
    sql: ${TABLE}."FREIGHT_VALUE" ;;
  }

  dimension: order_id {
    description: "Unique identifier of the order"
    type: string
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension: price {
    description: "Item price"
    type: number
    sql: ${TABLE}."PRICE" ;;
  }

  dimension: product_id {
    description: "Product unique identifier"
    type: string
    # hidden: yes
    sql: ${TABLE}."PRODUCT_ID" ;;
  }

  dimension: seller_id {
    description: "Seller unique identifier"
    type: string
    sql: ${TABLE}."SELLER_ID" ;;
  }

  dimension_group: shipping_limit_date {
    description: "Shows the seller shipping limit date for handling the order over to the logistic partner."
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SHIPPING_LIMIT_DATE" ;;
  }

  measure: count {
    label: "Count"
    type: count
    drill_fields: [order_item_id, products.product_category_name, products.product_id, orders.order_id]
  }

  measure: sum {
    label: "Sum"
    type: sum
    drill_fields: [order_item_id, products.product_category_name, products.product_id, orders.order_id]
  }

  measure: count_percent_of_total {
    label: "Count (Percent of total)"
    type: percent_of_total
    sql: ${count} ;;
    drill_fields: [order_item_id, products.product_category_name, products.product_id, orders.order_id]
    }

}
