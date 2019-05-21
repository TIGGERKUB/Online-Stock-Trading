CREATE VIEW open_close AS SELECT DATE(Order_Time) AS date,stock_symbol, MIN(TIME(Order_Time)) AS MinTime , MAX(TIME(Order_Time)) AS MaxTime, FROM stock_order GROUP BY DATE(Order_Time),stock_symbol

CREATE VIEW close_price AS SELECT DATE(Order_Time) AS date,stock_symbol, MAX(TIME(Order_Time)) AS close_time,Order_Price AS close_price FROM stock_order GROUP BY DATE(Order_Time),stock_symbol HAVING MAX(TIME(Order_Time))
