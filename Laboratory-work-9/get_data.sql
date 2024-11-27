CREATE OR REPLACE FUNCTION get_data(value TEXT, user_token TEXT)
RETURNS TABLE(h_id INT, name TEXT, address TEXT, confidentiality_label INT) AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM token WHERE token = user_token
    ) THEN
        RAISE EXCEPTION 'Invalid token';
    END IF;

    RETURN QUERY EXECUTE format(
        'SELECT h_id::INT, name::TEXT, address::TEXT, confidentiality_label::INT FROM hotel WHERE address = %L',
        value
    );
END;
$$ LANGUAGE plpgsql;
