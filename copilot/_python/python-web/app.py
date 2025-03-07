from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
    user_id = request.form['id']
    password = request.form['password']
    # Add your authentication logic here
    if user_id == 'admin' and password == 'password':
        return redirect(url_for('dashboard'))
    else:
        return 'Invalid credentials'

@app.route('/dashboard')
def dashboard():
    return 'Welcome to the dashboard!'

if __name__ == '__main__':
    app.run(debug=True)
