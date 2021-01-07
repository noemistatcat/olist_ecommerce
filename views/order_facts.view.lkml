view: order_facts {
  view_label: "Facts about order transactions"
    derived_table: {
      sql: SELECT
            orders.order_id,
            COUNT(*) AS order_item_count,
            SUM(order_items.price) AS price,
            SUM(order_items.freight_value) AS freight_value
            FROM "DATASETS"."ORDERS" AS orders
            LEFT JOIN "DATASETS"."ORDER_ITEMS" AS order_items
                ON orders.order_id = order_items.order_id
            GROUP BY orders.order_id;;
    }

  dimension: order_id {
    description: "Unique identifier of the order"
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.order_id ;;
  }

  measure: avg_item_per_order {
    label: "Average Items per Order"
    description: "Average number of items bought per transaction"
    type: average
    sql: ${TABLE}.order_item_count ;;
  }

  measure: total_order_price {
    label: "Total Order Value"
    description: "Total Order Value"
    type: sum
    sql: ${TABLE}.price ;;
    value_format: "$#.0;($#.0)"
  }

  measure: avg_order_value {
    label: "Average Order Value"
    description: "Average Order Value"
    type: average
    sql: ${TABLE}.price ;;
    value_format: "$#.0;($#.0)"
  }

  measure: total_freight_value {
    label: "Total Freight Value"
    description: "Total freight value"
    type: sum
    sql: ${TABLE}.freight_value ;;
    value_format: "$#.00;($#.00)"
  }

  measure: total_order_count {
    label: "Order Count"
    description: "Total order count"
    type: count_distinct
    sql: ${TABLE}.order_id ;;
  }
}
