import mysql.connector

try:
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="MyPassword123-",
        database="dbdi_ddat05"
    )

    print("Connection successful")

    cursor = connection.cursor()

    username = input('Type in username: ')
    password = input('Type in password: ')

    cursor.execute(
        "SELECT username, role FROM users WHERE username=%s AND password=SHA2(%s, 256)",
        (username, password)
    )

    result = cursor.fetchone()

    if result:
        print("Login successful")
    else:
        print("Login failed")

except mysql.connector.Error as err:
    print(f"Error: {err}")
