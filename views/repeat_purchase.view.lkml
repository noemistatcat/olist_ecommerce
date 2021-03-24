view: repeat_purchase {
  view_label: "Dimensions and Measures for repeat purchase behaviors"
  derived_table: {
    sql: SELECT
    customers.customer_unique_id,
    COUNT(*) AS lifetime_orders,
    SUM(order_items.price) AS price
    FROM "DATASETS"."CUSTOMERS" AS customers
    LEFT JOIN "DATASETS"."ORDERS" AS orders
        ON customers.customer_id = orders.customer_id
    LEFT JOIN "DATASETS"."ORDER_ITEMS" AS order_items
        ON orders.order_id = order_items.order_id
    GROUP BY customer_unique_id;;
}

  # Define your dimensions and measures here, like this:
  dimension: customer_unique_id {
    description: "Unique ID for each user that has ordered"
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_unique_id ;;
  }

  dimension: lifetime_orders {
    description: "The total number of orders for each user"
    type: number
    sql: ${TABLE}.lifetime_orders ;;
  }

  # dimension: is_repeat_customer {
  #   description: "Whether customer bought from the store only once or multiple times"
  #   type: yesno
  #   sql: ${TABLE}.lifetime_orders > 1 ;;
  # }

  measure: total_lifetime_orders {
    description: "Use this for counting lifetime orders across many users"
    type: sum
    sql: ${TABLE}.lifetime_orders ;;
    }

  measure: avg_lifetime_orders {
    description: "Use this for averaging lifetime orders across many users"
    type: average
    sql: ${lifetime_orders} ;;
    value_format: "0.0"
    }

  # measure: total_lifetime_value {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${TABLE}.price ;;
  #   value_format: "$#.00;($#.00)"
  # }

  measure: avg_lifetime_value {
    description: "Use this for averaging lifetime orders across many users"
    type: average
    sql: ${TABLE}.price ;;
    value_format: "$#.00;($#.00)"
  }

  measure: count_distinct_customer_id {
    label: "Count (Distinct)"
    type: count_distinct
    sql: ${TABLE}.customer_unique_id ;;
    }
}
