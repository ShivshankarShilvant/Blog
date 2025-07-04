from flask import Flask, render_template,request,session,redirect,url_for,flash
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
import json
import os
import math
import pymysql
from datetime import datetime

with open('config.json','r') as c:
    params = json.load(c)["params"]
# FIX: Replace MySQLdb with pymysql
pymysql.install_as_MySQLdb()

local_server=True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
if local_server:
    app.config["SQLALCHEMY_DATABASE_URI"] = params['local_uri']
else:
    app.config["SQLALCHEMY_DATABASE_URI"] = params['prod_uri']
db = SQLAlchemy(app)


class Contacts(db.Model):
    Sno = db.Column (db.Integer, primary_key=True)
    name = db.Column (db.String(80), unique=False, nullable=False)
    phone_num = db.Column (db.String(12),  nullable=False)
    msg = db.Column(db.String(120),  nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(120),  nullable=False)

class Posts(db.Model):
    Sno = db.Column (db.Integer, primary_key=True)
    title = db.Column (db.String(80), unique=False, nullable=False)
    slug = db.Column (db.String(21),  nullable=False)
    content = db.Column(db.String(120),  nullable=False)
    tagline = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)

@app.route("/")
def home():
    flash("Holle,Wellcome to nature blog ","success ")
    posts = Posts.query.all()
    last = math.ceil(len(posts) / int(params['no_of_posts']))

    # Get current page from URL, default to 1
    page = request.args.get('page')
    if not (str(page).isnumeric() and int(page) > 0):
        page = 1
    else:
        page = int(page)

    # Pagination slicing
    start = (page - 1) * int(params['no_of_posts'])
    end = start + int(params['no_of_posts'])
    posts = posts[start:end]

    # Pagination links
    if page == 1:
        prev = "#"
        next = f"/?page={page + 1}"
    elif page >= last:
        prev = f"/?page={page - 1}"
        next = "#"
    else:
        prev = f"/?page={page - 1}"
        next = f"/?page={page + 1}"

    return render_template('index.html',params=params,posts=posts,prev=prev ,next=next)

@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html',params=params, post=post)

@app.route("/about")
def about():
    return render_template('about.html',params=params)

@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    # Check if user is already logged in
    if 'user' in session and session['user'] == params['admin_user']:
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params,posts=posts)

    # Handle POST (login form submission)
    if request.method == 'POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')

        # Validate credentials
        if username == params['admin_user'] and userpass == params['admin_password']:
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params=params,posts=posts)
        else:
            # Invalid credentials
            return render_template('login.html', params=params )

    # Default case: Not logged in and not POST
    return render_template('login.html', params=params,error="Invalid Username or Password")

@app.route("/edit/<int:Sno>", methods=['GET', 'POST'])
def edit(Sno):
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if Sno == 0:
                post = Posts(title=box_title, slug=slug, content=content, tagline=tline, img_file=img_file, date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(Sno=Sno).first()
                if post:
                    post.title = box_title
                    post.slug = slug
                    post.content = content
                    post.tagline = tline
                    post.img_file = img_file
                    post.date = date
                    db.session.commit()
            return redirect('/edit/' + str(Sno))

        # GET request
        post = None
        if Sno != 0:
            post = Posts.query.filter_by(Sno=Sno).first()
        return render_template('edit.html', params=params, post=post)


@app.route("/uploader", methods = ['GET','POST'])
def uploader():
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            f= request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
            return "Uploaded successfully"

@app.route("/delete/<string:Sno>",methods = ['GET','POST'])
def delete(Sno):
    if 'user' in session and session['user'] == params['admin_user']:
        post=Posts.query.filter_by(Sno=Sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/contact", methods = ['GET','POST'])
def contact():
    if request.method== 'POST':
        '''Add enter to the database'''
        name=request.form.get('name')
        email=request.form.get('email')
        phone=request.form.get('phone')
        message=request.form.get('message')
        entry = Contacts(name=name, phone_num=phone, msg=message, date= datetime.now(), email=email)
        db.session.add(entry)
        db.session.commit()
        flash("Thanks for submitting your details. We will get back to you SOON!","success ")
    return render_template('contact.html',params=params)

app.run(debug=True)