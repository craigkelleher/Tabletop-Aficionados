from flask_wtf import FlaskForm
from wtforms import Form, StringField, SelectField, SubmitField
from wtforms.validators import DataRequired

class SearchForm(FlaskForm):
    choices = [('Boardgame Name', 'Boardgame Name'),
               ('Designer Last Name', 'Designer Last Name'),
               ('Publisher', 'Publisher'),
               ('Genre', 'Genre')]
    select_search = SelectField('Search:', [DataRequired()], choices=choices)
    search_keyword = StringField("Insert search:", [DataRequired()])
    submit = SubmitField("Submit")