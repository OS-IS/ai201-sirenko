CREATE OR REPLACE FUNCTION user_login(client_ip INET, client_port INTEGER, backend_pid INTEGER)
RETURNS VARCHAR AS $$
DECLARE
    token TEXT;
BEGIN
    token := md5(random()::TEXT || clock_timestamp()::TEXT);
    
    INSERT INTO token (token, client_ip, client_port, backend_pid) VALUES (token, client_ip, client_port, backend_pid);
    RETURN token;
END;
$$ LANGUAGE plpgsql;
