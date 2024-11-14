CREATE OR REPLACE FUNCTION change_data(attr1_value TEXT, new_attr2_value TEXT)
RETURNS VOID AS $$
BEGIN
    EXECUTE 'UPDATE hotel SET name = $2 WHERE address = $1'
    USING new_attr2_value, attr1_value;
END;
$$ LANGUAGE plpgsql;
