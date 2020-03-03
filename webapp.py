from flask import Flask, render_template
from flask import request, redirect
from db_connector.db_connector import connect_to_database, execute_query
webapp=Flask(__name__)

app.config['MYSQL_DATABASE_USER'] = 'cs340_kellehec'
app.config['MYSQL_DATABASE_PASSWORD'] = 'password'
app.config['MYSQL_DATABASE_DB'] = 'cs340_kellehec'
app.config['MYSQL_DATABASE_host'] = ' '
mysql.init_app(app)

@webapp.route('/users',methods = ['GET','POST'])
def insert_data():
  db_connection = connect_to_database()  
  if request.method == 'POST':
      print("Add new users!");
      first_name = request.form['firstname']
      last_name = request.form['lastname']
      email = request.form['email']

      query = "INSERT INTO Users(userFirstName, userLastName, email) VALUES(%s, %s, %s)"
      data = (first_name, last_name, email)
      execute_query(db_connection, query, data)
      return ('User added!');
  elif request.method == 'GET':
    query = 'SELECT userFirstName, userLastName, email from Users'
    result = execute_query(db_connection, query).fetchall();
    print(result)

    return render_template('account.html', account_info = result)    


@webapp.route('/boardgames',methods = ['GET','POST'])
def insert_data():
  db_connection = connect_to_database()  
  if request.method == 'POST':
      print("Add new boardgames!");
      boardgame_name = request.form['boardgamename']
      designerFN = request.form['designerFN']
      designerLN = request.form['designerLN']
      publisher_name = request.form['publisher']
      release_date = request.form['releasedate']
      genre = request.form['genres']
      description = request.form['description']

      query = "INSERT INTO Boardgames(boardgameName, releaseDate, genre) VALUES(%s, %s, %s)"
      data = (boardgame_name, release_date, genre)
      execute_query(db_connection, query, data)
      return ('Board game added!');
  elif request.method == 'GET':
      query = 'SELECT boardgameName, releaseDate, genre from Boardgames'
      result = execute_query(db_connection, query).fetchall();
      print(result)

      return render_template('boardgames.html', game_info = result)    





