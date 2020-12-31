view: test_view {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: SELECT
        order_id
      FROM orders
      ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: order_id {
    description: "Unique ID for each user that has ordered"
    type: number
    sql: ${TABLE}.order_id ;;
  }
}
