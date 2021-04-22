view: orders {
  view_label: "Main order data"
  sql_table_name: "DATASETS"."ORDERS";;
  drill_fields: [order_id]

  dimension: order_id {
    label: "Unique Order ID"
    description: "Unique identifier of the order"
    primary_key: yes
    type: string
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension: customer_id {
    description: "Key to the customer dataset. Each order has a unique customer_id."
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension_group: order_approved_at {
    description: "Shows the payment approval timestamp."
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ORDER_APPROVED_AT" ;;
  }

  dimension_group: order_delivered_carrier {
    description: "Shows the order posting timestamp. When it was handled to the logistic partner."
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ORDER_DELIVERED_CARRIER_DATE" ;;
  }

  dimension_group: order_delivered_customer {
    description: "Shows the actual order delivery date to the customer."
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ORDER_DELIVERED_CUSTOMER_DATE" ;;
  }

  dimension_group: order_estimated_delivery {
    description: "Shows the estimated delivery date that was informed to customer at the purchase moment."
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ORDER_ESTIMATED_DELIVERY_DATE" ;;
  }

  dimension_group: order_purchase_timestamp {
    description: "Shows the purchase timestamp."
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ORDER_PURCHASE_TIMESTAMP" ;;
  }

  dimension: order_status {
    description: "Reference to the order status (delivered, shipped, etc)."
    type: string
    sql: ${TABLE}."ORDER_STATUS" ;;
  }

  measure: count {
    label: "Count"
    type: count
    drill_fields: [order_id, order_items.count, order_payments.count]
  }

  measure: count_distinct {
    label: "Count (Distinct)"
    type: count_distinct
    drill_fields: [order_id, order_items.count, order_payments.count]
  }

  measure: count_percent_of_total {
    label: "Count (Percent of total)"
    type: percent_of_total
    sql: ${count} ;;
    drill_fields: [order_id, order_items.count, order_payments.count]
  }

}
