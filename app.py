from flask import Flask

# Create a Flask application
app = Flask(__name__)


# Define a route for the homepage
@app.route('/')
def home():
    return 'Hi this is a simple Web Application to demonstrate working of K8s!'


@app.route('/home')
def home():
    return 'This is Home'


# Run the app
if __name__ == '__main__':
    app.run(debug=True)
