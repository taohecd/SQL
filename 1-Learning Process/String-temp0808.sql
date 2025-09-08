USE bakery;

SELECT first_name
, length(first_name) LEN
, ltrim('   left') L_Trim   # rtrim()
, trim('I   like   it') T_rim    # Cannot trim regular space such as 'I like it'
, upper(left(first_name,2)) L_eft  -- lower(), right()
, substring(first_name,2,3) as Sub  # Useful for Phone Numbers and Email Address.
, replace(first_name, 'A', '$')  # Case Sensitive
FROM customers
;

