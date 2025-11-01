# 🌿 Nature Blog

A Flask-powered blog platform for sharing stories, images, and inspiration about the natural world. This project features a clean, responsive Bootstrap interface, admin dashboard, post management, file uploads, and a contact form—all driven by a MySQL backend.

## Features

- **Home Page:** See a paginated feed of poetic, photo-rich nature posts.
- **Post Pages:** Each post has its own beautiful page with images, title, tagline, and date.
- **Admin Dashboard:** Secure login for admins, add/edit/delete posts, and upload images or files.
- **Contact Form:** Visitors can reach out; messages are stored in the database and admins get notified.
- **About Page:** Share your story and the mission of your blog.
- **Responsive Design:** Optimized for all devices using Bootstrap and custom CSS.
- **Database-Driven:** Uses SQLAlchemy ORM for Posts and Contacts tables; database schema provided in `shivucoding.sql`.
- **Configurable:** All settings (database URIs, admin login, social links, etc.) are in `config.json`.

## Project Structure

- `main.py` — Main Flask application, routes, models, and business logic.
- `templates/` — Jinja2 HTML templates: `index.html`, `post.html`, `dashboard.html`, `edit.html`, `about.html`, `contact.html`, `login.html`, `layout.html`.
- `static/` — CSS (`styles.css`, `sign-in.css`), JS (`scripts.js`), image and asset files.
- `config.json` — Configuration file for environment, database, and blog metadata.
- `shivucoding.sql` — MySQL dump for setting up the required tables and demo data.

## How to Run

1. **Clone the repository.**
2. **Install dependencies:**  
   `pip install flask flask_sqlalchemy pymysql`
3. **Set up the database:**  
   Import `shivucoding.sql` into your MySQL server.
4. **Edit `config.json`:**  
   Set your database URIs, admin credentials, and other params.
5. **Run the app:**  
   `python main.py`
6. **Visit:**  
   Open `http://127.0.0.1:5000` in your browser.

## Admin Access

- Go to `/dashboard` to log in as admin.
- Credentials are set in `config.json` (`admin_user` and `admin_password`).

## Customization

- Update the `about_text` and social links in `config.json`.
- Add new images to `static/assets/img/`.
- Design your own posts and visuals.

## License

This project is for educational and personal use.  
Not for commercial deployment without the author's permission.

---

**Created by Shivshankar Shilvant**
