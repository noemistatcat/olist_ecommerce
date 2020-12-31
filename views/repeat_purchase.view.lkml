include: "/views/*.view" # include all the views

view: repeat_purchase {
  view_label: "Dimensions and Measures for repeat purchase behaviors"
  derived_table: {
    sql: SELECT
    order_items.customer_id,
    COUNT(*) AS lifetime_orders,
    MIN(orders.order_purchase_timestamp) AS first_purchase_date,
    MAX(orders.order_purchase_timestamp) AS last_purchase_date,
    SUM(order_items.price) AS price
    FROM orders
    LEFT JOIN orders AS a order_items AS b
        ON a.order_id = b.order_id
    GROUP BY customer_id;;
  }

  # Define your dimensions and measures here, like this:
  dimension: customer_id {
    description: "Unique ID for each user that has ordered"
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: lifetime_orders {
    description: "The total number of orders for each user"
    type: number
    sql: ${TABLE}.lifetime_orders ;;
  }

  dimension: is_repeat_customer {
    description: "Whether customer bought from the store only once or multiple times"
    type: yesno
    sql: ${TABLE}.lifetime_orders > 1 ;;
  }

  dimension_group: last_purchase_date {
    description: "The date when each user last ordered"
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.last_purchase_date ;;
  }

  dimension_group: first_purchase_date {
    description: "The date when each user first ordered"
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.first_purchase_date ;;
  }

  measure: total_lifetime_orders {
    description: "Use this for counting lifetime orders across many users"
    type: sum
    sql: ${TABLE}.lifetime_orders ;;
    }

  measure: avg_lifetime_orders {
    description: "Use this for averaging lifetime orders across many users"
    type: average
    sql: ${lifetime_orders} ;;
    }

  measure: total_lifetime_value {
    description: "Use this for counting lifetime orders across many users"
    type: sum
    sql: ${TABLE}.price ;;
  }

  measure: avg_lifetime_value {
    description: "Use this for averaging lifetime orders across many users"
    type: average
    sql: ${TABLE}.price ;;
  }

}
