view: orders {
  sql_table_name: "DATASETS"."ORDERS";;
  drill_fields: [order_id]

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: delivery_status {
    type: yesno
    sql: ${TABLE}."DELIVERY_STATUS" ;;
  }

  dimension_group: order_approved {
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
    type: string
    sql: ${TABLE}."ORDER_STATUS" ;;
  }

  measure: count {
    type: count
    drill_fields: [order_id, order_items.count, order_payments.count]
  }

  measure: count_percent_of_total {
    label: "Count (Percent of total)"
    type: percent_of_total
    sql: ${count} ;;
    drill_fields: [order_id, order_items.count, order_payments.count]
  }

}
