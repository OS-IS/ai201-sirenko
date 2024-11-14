CREATE OR REPLACE FUNCTION change_data(attr1_value TEXT, new_attr2_value TEXT)
RETURNS VOID AS $$
BEGIN
    UPDATE hotel SET name = new_attr2_value WHERE address = attr1_value;
END;
$$ LANGUAGE plpgsql;
