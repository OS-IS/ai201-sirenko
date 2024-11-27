### 1. Перевірка надійності пароля за списком "10000 найгірших паролів"
   
   Створити таблицю в БД СКБД PostgreSQL, назва якої відповідає назві файлу, та завантажити вміст файлу у таблицю, використовуючи будь-який засіб імпорту, наприклад, команду \COPY утиліти psql.
   
   ![image](https://github.com/user-attachments/assets/3549dad4-dbc7-4e77-9413-dc3e8f4d186b)

  Створити функцію user_register на мові програмування PL/pgSQL, яка буде забороняти створювати пароль, якщо він є у таблиці гірших паролів.

```
CREATE OR REPLACE FUNCTION user_register(test_password TEXT)
RETURNS BOOLEAN AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM keyboard_combinations WHERE password = test_password) THEN
        RAISE EXCEPTION 'Password is too weak';
        RETURN FALSE;
    ELSE
        RETURN TRUE;
    END IF;
END;
$$ LANGUAGE plpgsql;
```
  
  ![image](https://github.com/user-attachments/assets/db517d2f-8054-487e-9fbd-dfec66ba0f93)
