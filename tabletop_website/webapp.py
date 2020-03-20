from flask import Flask, render_template, request, redirect, url_for, session
from db_connector.db_connector import connect_to_database, execute_query
webapp = Flask(__name__)

@webapp.route('/')
def index():
    return render_template('index.html')

@webapp.route('/browse_boardgames')
#the name of this function is just a cosmetic thing
def browse_people():
    print("Fetching and rendering people web page")
    db_connection = connect_to_database()
    query = "SELECT boardgameName, rating, releaseDate, genre, boardgameID from Boardgames;"
    result = execute_query(db_connection, query).fetchall();
    print(result)
    return render_template('browse_boardgames.html', rows=result)

@webapp.route('/add_new_boardgames', methods = ['GET','POST'])
def insert_gamedata():
    db_connection = connect_to_database()  
    if request.method == 'POST':
        print("Add new boardgames!");
        boardgame_name = request.form['boardgameName']
        designerFirstName = request.form['designerFirstName']
        designerLastName = request.form['designerLastName']
        publisherName = request.form['publisherName']
        releaseDate = request.form['releaseDate']
        genre = request.form['genre']
        description = request.form['description']
        query_game= 'INSERT INTO Boardgames(boardgameName, releaseDate, genre) VALUES(%s, %s, %s)'
        data_game = (boardgameName, releaseDate, genre)
        query_publisher = 'INSERT INTO PrimaryPublishers(publisherName) VALUES(%s)'
        data_publisher = (publisherName)
        query_designer = 'INSERT INTO PrimaryDesigners(designerFirstName, designerLastName) VALUES(%s, %s)'
        data_designer = (designerFirstName, designerLastName)
        execute_query(db_connection, query_game, data_game, query_publisher, data_publisher, query_designer, data_designer)
        return ('Board game added!');
    elif request.method == 'GET':
        query = 'SELECT boardgameID, boardgameName FROM Boardgames'
        result = execute_query(db_connection, query).fetchall();
        print(result)
        return render_template('boardgames_add_new.html', boardgames = result)
        return render_template('tabletopinfo.html', game = result)  

@webapp.route('/update_boardgames/<int:id>', methods=['POST','GET'])
def update_boardgame(id):
    db_connection = connect_to_database()
    if request.method == 'GET':
        boardgame_query = 'SELECT boardgameID, boardgameName FROM Boardgames WHERE boardgameID = %s' % (id)
        boardgame_result = execute_query(db_connection, boardgame_query).fetchone()

        if boardgame_result == None:
            return "No such boardgame found"
        publisher_query = 'SELECT publisherName, FROM PrimaryPublishers'
        publisher_result = execute_query(db_connection, publisher_query).fetchall();
        return render_template('boardgame_update.html', publisher = publisher_result, boardgames = boardgame_result)
    elif request.method == 'POST':
        print("Update Boardgame!");
        boardgameID = request.form['boardgameID']
        boardgameName = request.form['boardgameName']
        releaseDate = request.form['releaseDate']
        genre = request.form['genre']
        print(request.form)

        query = 'UPDATE Boardgames SET boardgameName =%s, releaseDate = %s, genre = %s WHERE boardgameID = %s'
        data = (boardgameName, releaseDate, genre, boardgameID)
        result = execute_query(db_connection, query, data)
        print(str(result.rowcount) + " row9s) updated");
        return redirect('browse_boardgames')

@webapp.route('/delete_boardgames/<int:id>')
def delete_people(id):
    db_connection = connect_to_database()
    query = "DELETE FROM boardgameName WHERE boardgameID = %s"
    data = (id,)

    result = execute_query(db_connection, query, data)
    return (str(result.rowcount) + "row deleted")
