SELECT * FROM
	customer
	JOIN
  	(SELECT * FROM (
		SELECT stream_count_table.customerid, (cast(ticket_count AS float)/cast(stream_count AS float)) AS profitability_score FROM
			(SELECT COUNT(customerid) AS stream_count, customerid FROM "stream" GROUP BY customerid) AS stream_count_table
		JOIN
			(SELECT COUNT(customerid) AS ticket_count, customerid FROM ticket GROUP BY customerid) AS ticket_count_table
		ON stream_count_table.customerid = ticket_count_table.customerid ) ) AS profitability_table
	ON customer.id = profitability_table.customerid
	ORDER BY profitability_score DESC