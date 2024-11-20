### Криптографічний захист клієнт-серверної взаємодії в СКБД PostgreSQL

1. Встановити OpenSSL-пакет. В терміналі командного рядку запустити утиліту openssl та переглянути перелік доступних команд.
![image](https://github.com/user-attachments/assets/9cc5991d-988e-4492-8536-26af3ab7762b)

2. Створити самопідписаний сертифікат для сервера СКБД PostgreSQL з наступними параметрами:
  − атрибути C=UA, L=Odessa, O=OPU, OU=group, CN=surname.op.edu.ua, де group

  – назва вашої групи латиницею, surname ваше прізвище латиницею

  − строк дії сертифікату = (variant * 10) днів, де variant значення вашого варіанту.

  ![image](https://github.com/user-attachments/assets/b1320e4f-a4f4-4528-a282-6c8e6ca45ccc)

3 Переглянути вміст сертифікату та визначити алгоритми створення відкритого ключа, а також алгоритм встановлення цифрового підпису.
![image](https://github.com/user-attachments/assets/ec9bc397-5dff-407a-9a8c-3f371b5ea745)

4. Скопіювати створений сертифікат відкритого ключа та закритий ключ до каталогу сервера СКБД PostgreSQL, яка використовувалася у попередній лабораторній роботі. У конфігураційному файлі postgresql.conf налаштувати значення SSL-параметрів для підтримки SSL-з'єднання між сервером та клієнтами.
![image](https://github.com/user-attachments/assets/c0878127-da74-49ba-89c0-6ba52dc033f8)

5. Використовуючи програму psql, встановити TSL/SSL-з'єднання з БД за прикладом з попередньої лабораторної роботи, але використовуючи формат параметрів "host=var1 port=var2 dbname=var3 user=var4 password=var5 sslmode=var6". Визначити версію TSL-протоколу та перелік використаних криптоалгоритмів.
![image](https://github.com/user-attachments/assets/8d254f48-d0e5-4d5c-b2f6-0137185334a1)

6. Встановити ПЗ контейнерної віртуалізації Docker та запустити Docker через ваш Docker-обліковий запис.
![image](https://github.com/user-attachments/assets/6d5710a4-353b-4311-b6cb-f0a2d4b2450a)

7. Запустити Docker-контейнер СКБД PostgreSQL, використовуючи раніше розглянуті приклади (порт прослуховування запитів СКБД PostgreSQL = 5466).
![image](https://github.com/user-attachments/assets/c7d7d524-dd40-4f6e-8b8d-f5eea9af68be)

8. У Docker-контейнері встановити програмний пакунок аналізу мережевих пакетів tcpdump. Отримати перелік мережевих інтерфейсів на вашому комп’ютері.
![image](https://github.com/user-attachments/assets/6abe28c3-218d-4daa-aaef-8cb6421ee2ef)

![image](https://github.com/user-attachments/assets/b0f87e72-320a-4c34-b4db-05085ff254c2)


9. Провести запуск програми аналізу мережевих пакетів для кожного мережевого інтерфейсу поки не буде знайдено активний інтерфейс, який взаємодіє з мережею Internet та виводить на екран інформацію про ці пакети.
![image](https://github.com/user-attachments/assets/101cb6ac-2e0d-4d95-bd47-c6409cfc12bc)

    
10. Запустити програму аналізу мережевих пакетів в режимі прослуховування обраного мережевого інтерфейсу та налаштувати її на перегляд пакетів, які пов`язані з портом 5466, зберігаючи зміст пакетів в окремому файлі через перенаправлення потоку, наприклад, > res.dump. Результати роботи будуть використанні у наступних завданнях.
![image](https://github.com/user-attachments/assets/08c78b95-1683-4b60-8c48-0fbccb5ed7a6)

    
11. Запустити окрему термінальну консоль та становити зв'язок із СКБД PostgreSQL, яка запущена через Docker-контейнер. Після успішного встановлення визначити версію TSL- протоколу та перелік використаних криптографічних алгоритмів.
![image](https://github.com/user-attachments/assets/ef4dfa18-91ae-4041-b803-a80eb0b33e94)

    
12. Виконати команду створення користувача за прикладом з лабораторної роботи No6.
![image](https://github.com/user-attachments/assets/6b49fed4-d556-48e2-897a-644cd7462b0b)


    
13. Проаналізувати вміст перехоплених пакетів, які було збережено у файлі, наприклад, res.dump. Підтвердити передачу деяких даних у відкритому вигляді.
![image](https://github.com/user-attachments/assets/5b37201d-627d-45bb-a5b2-2a624ad11cb4)

    
14. Повторити пункт 11, встановивши зв’язок із СКБД, але вже через TLS/SSL- з’єднання.
![image](https://github.com/user-attachments/assets/51bf29ac-2190-470e-8e13-bb4c674a16a2)
![image](https://github.com/user-attachments/assets/983c34d1-6e25-4328-8750-6dcfcadbe177)

    