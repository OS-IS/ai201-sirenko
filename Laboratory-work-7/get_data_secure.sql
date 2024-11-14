CREATE OR REPLACE FUNCTION get_data(attr_value TEXT)
RETURNS TABLE (h_id INT, name TEXT, address TEXT, confidentiality_label INT) AS $$
BEGIN
    RETURN QUERY EXECUTE 'SELECT * FROM hotel WHERE address = $1'
    USING attr_value;
END;
$$ LANGUAGE plpgsql;
