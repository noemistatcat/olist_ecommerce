view: order_items {
  sql_table_name: "DATASETS"."ORDER_ITEMS"
    ;;
  drill_fields: [order_item_id]

  dimension: order_item_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ORDER_ITEM_ID" ;;
  }

  dimension: freight_value {
    type: number
    sql: ${TABLE}."FREIGHT_VALUE" ;;
  }

  dimension: order_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}."PRICE" ;;
  }

  dimension: product_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."PRODUCT_ID" ;;
  }

  dimension: seller_id {
    type: string
    sql: ${TABLE}."SELLER_ID" ;;
  }

  dimension_group: shipping_limit {
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
    type: count
    drill_fields: [order_item_id, products.product_category_name, products.product_id, orders.order_id]
  }

  measure: sum {
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
