CREATE OR REPLACE FUNCTION user_register_secure(input_password TEXT)
RETURNS BOOLEAN AS $$
DECLARE
    special_chars CONSTANT TEXT := '!@#$%^&*';
BEGIN
    -- Перевірка мінімальної довжини
    IF LENGTH(input_password) < 16 THEN
        RAISE EXCEPTION 'Password must be at least 16 characters long.';
    END IF;

    -- Перевірка наявності цифр
    IF LENGTH(REGEXP_REPLACE(input_password, '[^0-9]', '', 'g')) < 1 THEN
        RAISE EXCEPTION 'Password must contain at least 1 digits.';
    END IF;

    -- Перевірка нижнього регістру
    IF LENGTH(REGEXP_REPLACE(input_password, '[^a-z]', '', 'g')) < 4 THEN
        RAISE EXCEPTION 'Password must contain at least 4 lowercase letters.';
    END IF;

    -- Перевірка верхнього регістру
    IF LENGTH(REGEXP_REPLACE(input_password, '[^A-Z]', '', 'g')) < 4 THEN
        RAISE EXCEPTION 'Password must contain at least 4 uppercase letters.';
    END IF;

    -- Перевірка спеціальних символів
    IF LENGTH(REGEXP_REPLACE(input_password, '[^!@#$%^&*]', '', 'g')) < 4 THEN
        RAISE EXCEPTION 'Password must contain at least 4 special characters.';
    END IF;

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;
