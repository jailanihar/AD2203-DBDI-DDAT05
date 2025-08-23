# Lecturer using this because his
# database is MariaDB
# import pymysql
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
        (username, password) #tuple
    )

    result = cursor.fetchone()
    print(result)
    print(result[1])

    if result:
        if result[1] == 'lecturer':
            print('Login as lecturer')
            print('Adding student account')
            student_username = input('Type in student username: ')
            student_password = input('Type in student password: ')
            add_student_cursor = connection.cursor()
            add_student_cursor.execute(
                'INSERT INTO users VALUES (%s, SHA2(%s,256), %s)',
                (student_username, student_password, 'student')
            )
            connection.commit()
        elif result[1] == 'student':
            print('Login as student')
            get_students_cursor = connection.cursor()
            get_students_cursor.execute(
                'SELECT username FROM users WHERE role=\'student\''
            )
            students_result = get_students_cursor.fetchall()
            print(students_result)
            for student in students_result:
                print(f"{student[0]} {'(you)' if student[0] == username else '(not you)'}")
        else:
            print('Login as guest')
    else:
        print("Login failed")

except mysql.connector.Error as err:
    print(f"Error: {err}")
