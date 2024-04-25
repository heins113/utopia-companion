SELECT genre, gender, ageRange, Count(*) 
FROM agedCustomerWithTicket 
GROUP BY genre, gender, ageRange
ORDER BY genre, gender
LIMIT 5000