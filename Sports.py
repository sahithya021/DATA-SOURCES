import mysql.connector

# connecting to the database 
mydb = mysql.connector.connect(
    host = 'localhost',
    user = 'root',
    password = 'root',
    port = '3306',
    # mention database name
    database = 'sports'
)

# declare cursor for fetching
mycursor = mydb.cursor()

# selecting a table from the database 
mycursor.execute("select *from Athletes")
# fetching the data from the cursor 
Athletes_tab = mycursor.fetchall()
print("\n******* Athletes Details *******")
# writing the details in text file 
with open('Athletes.txt','w') as f:
    # loop for fetching the data 
    for i in Athletes_tab:
        # write in file
        f.write(str(i))
        f.write('\t')
        # printing the values  
        print(i)

print("\n")
