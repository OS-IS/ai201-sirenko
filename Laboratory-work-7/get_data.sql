CREATE OR REPLACE FUNCTION get_data(attr_value VARCHAR(50))
RETURNS TABLE (h_id INT, name VARCHAR(50), address VARCHAR(50), confidentiality_label INT) AS $$
BEGIN
    RETURN QUERY EXECUTE 'SELECT * FROM hotel WHERE address = ''' || attr_value || '''';
END;
$$ LANGUAGE plpgsql;
