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
            GROUP BY order_id;;
    }

  dimension: order_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.order_id ;;
  }

  measure: avg_item_per_order {
    description: "Use this for getting the average items per order"
    type: average
    sql: ${TABLE}.order_item_count ;;
  }

  measure: total_order_price {
    description: "Use this for getting the total order price"
    type: average
    sql: ${TABLE}.order_item_count ;;
  }

  measure: total_freight_value {
    description: "Use this for getting the total freight value"
    type: sum
    sql: ${TABLE}.freight_value ;;
  }

  measure: total_order_count {
    description: "Use this for getting the total freight value"
    type: count_distinct
    sql: ${TABLE}.order_id ;;
  }

}
