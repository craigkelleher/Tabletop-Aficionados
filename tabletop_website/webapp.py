from flask import Flask, render_template, request, redirect, url_for, session
from flask import request, redirect
from db_connector.db_connector import connect_to_database, execute_query
webapp = Flask(__name__)

@webapp.route('/')
def home():
    return render_template('index.html')



@webapp.route('/login', methods = ['GET', 'POST'])
def login():
    msg = 'Login error!'
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
        username = request.form['username']
        password = request.form['password']

        query = 'SELECT * FROM Users WHERE username = %s AND password = %s'
        data = (username, password)
        account = execute_query(db_connection, query, data).fetchone();
        if account:
              session['loggedin'] = True
              session['id'] = account['userID']
              session['username'] = account['username']
              return 'Logged in!'
        else:
              msg = 'Incorrect login information: either your username or password'    
        return render_template('login.html', msg=msg)

@webapp.route('/logout')
def logout():
      session.pop('loggedin', None)
      session.pop('id', None)
      session.pop('username', None)
      return redirect(url_for('login'))

@webapp.route('/add_users', methods = ['GET','POST'])
def insert_userdata():
  db_connection = connect_to_database()  
  if request.method == 'POST':
      print("Add new users!");
      first_name = request.form['firstname']
      last_name = request.form['lastname']
      user_name = request.form['username']
      email = request.form['email']
      pass_word = request.form['password']

      query = 'INSERT INTO Users(userFirstName, userLastName, screenName, email, passWord) VALUES(%s, %s, %s, %s, %s)'
      data = (first_name, last_name, user_name, email, pass_word)
      execute_query(db_connection, query, data)
      return ('User added!');
  elif request.method == 'GET':
    user_FN = request.form['firstname']
    user_LN = request.form['lastname']
    screenname = request.form['username']
    query = 'SELECT userFirstName, userLastName, screenName from Users WHERE(userFirstName = %s, userLastName = %s, screenName = %s)'
    data = (user_FN, user_LN, screenname)
    result = execute_query(db_connection, query, data).fetchall();
    print(result)

    return render_template('account.html', account_info = result)    


@webapp.route('/add_boardgames',methods = ['GET','POST'])
def insert_gamedata():
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

      query_game= 'INSERT INTO Boardgames(boardgameName, releaseDate, genre) VALUES(%s, %s, %s)'
      data_game = (boardgame_name, release_date, genre)

      query_publisher = 'INSERT INTO PrimaryPublishers(publisherName) VALUES(%s)'
      data_publisher = (publisher_name)

      query_designer = 'INSERT INTO PrimaryDesigners(designerFirstName, designerLastName) VALUES(%s, %s)'
      data_designer = (designerFN, designerLN)

      execute_query(db_connection, query_game, data_game, query_publisher, data_publisher, query_designer, data_designer)
      return ('Board game added!');
  elif request.method == 'GET':
      boardgame_name = request.form['boardgamename']
      designerFN = request.form['designerFN']
      designerLN = request.form['designerLN']
      publisher_name = request.form['publisher']
      release_date = request.form['releasedate']
      genre_select = request.form['genres']
      query = 'SELECT Boardgames.boardgameName, PrimaryDesigners.designerFirstName, PrimaryDesigners.designerLastName\
               , PrimaryPublishers.publisherName, Boardgames.rating, Boardgames.releaseDate, Boardgames.genre, Boardgames.rating\
                from ((Boardgames INNER JOIN PrimaryDesigners ON Boardgames.designerID = PrimaryDesigners.designerID)\
                INNER JOIN PrimaryPublishers ON Boardgames.publisherID = PrimaryPublishers.publisherID) WHERE\
                (Boardgames.boardgameName = %s, PrimaryDesigners.designerFirstName = %s, PrimaryDesigners.designerLastName = %s,\
                PrimaryPublishers.publisherName = %s, Boardgames.releaseDate = %s, genre = %s)'
      data = (boardgame_name, designerFN, designerLN, publisher_name, release_date, genre_select)
      result = execute_query(db_connection, query, data).fetchone();

      return render_template('tabletopinfo.html', game = result)    

@webapp.route('/update_account', methods = ['GET', 'POST'])
def update_accountdata():
  db_connection = connect_to_database() 
  if request.method == 'GET':
        query = 'SELECT userID, userFirstName, userLastName, username, email, password WHERE userID = %s'
        data = session['id']
        account_result = execute_query(db_connection, query, data).fetchone()
        if result == None:
          return "No such account found!"
        return render_template('templates.account.html', account = account_result)  
  elif request.method == 'POST':
        user_id = request.form['user_id']
        user_first = request.form['firstname'] 
        user_last = request.form['lastname'] 
        screen_name = request.form['username'] 
        email_change = request.form['email']
        passcode = request.form['password'] 

        query = 'UPDATE Users SET userFirstName = %s, userLastName = %s, email = %s, username = %s, password = %s WHERE userID = %s'   
        data = (user_first, user_last, email_change, screen_name, passcode, user_id)
        result = execute_query(db_connection, query, data)
        return (str(result.rowcount) + " row(s) updated");

@webapp.route('/edit_rating', methods = ['GET', 'POST'])
def update_ratingdata():
    db_connection = connect_to_database()
    if request.method == 'GET':
        query = 'SELECT Boardgames.boardgameName, Boardgames.rating FROM ((Boardgames INNER JOIN UsersBoardgames \
                 ON Boardgames.boardgameID = UsersBoardgames.boardgameID) INNER JOIN Users ON Users.userID = UsersBoardgames.userID) \
                 WHERE userID = %s'
        data = (session['id'])
        rating_result = execute_query(db_connection, query, data).fetchall()
        if rating_result == None:
            return "No reviews made yet!"
        return render_template('account.html', ratings = rating_result)
    elif request.method == 'POST':
        if request.form['button'] == 'update':
              game_name = request.form['boardgame']
              rating = request.form['rating']

              query = 'UPDATE Boardgames SET rating = %s WHERE boardgameName = %s'
              data = (rating, game_name)
              update_rating_result = execute_query(db_connection, query, data)
              return "Rating updated!"
        elif request.form['button'] == 'delete':
              query = 'DELETE FROM UsersBoardgames WHERE userID = %s'
              data = (session['id'])
              delete_result = execute_query(db_connection, query, data)  
              return redirect(url_for('edit_rating'))
