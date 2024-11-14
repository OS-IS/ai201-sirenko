CREATE OR REPLACE FUNCTION change_data(attr1_value TEXT, attr2_value TEXT)
RETURNS VOID AS $$
BEGIN
    EXECUTE 'UPDATE hotel SET name = ''' || attr2_value || ''' WHERE address = ''' || attr1_value || '''';
END;
$$ LANGUAGE plpgsql;
