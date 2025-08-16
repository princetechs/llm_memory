# Llm Memory

A beautiful, modern Rails 8 application with a stunning authentication system built with Tailwind CSS.

## Features

### 🎨 Beautiful Authentication UI
- **Modern Design**: Clean, responsive design with beautiful gradients and shadows
- **Tailwind CSS**: Built with Tailwind CSS for consistent, beautiful styling
- **Smooth Animations**: Custom CSS animations and hover effects
- **Responsive Layout**: Works perfectly on all device sizes

### 🔐 Authentication System
- **User Registration**: Beautiful signup form with validation
- **User Login**: Elegant login screen with remember me functionality
- **Password Reset**: Secure password reset via email
- **Session Management**: Secure session handling with Rails 8
- **Rate Limiting**: Built-in protection against brute force attacks

### 🚀 Technical Features
- **Rails 8**: Built with the latest Rails framework
- **Secure Passwords**: Uses `has_secure_password` with bcrypt
- **Email Validation**: Proper email format validation
- **Error Handling**: Beautiful error displays with validation feedback
- **Flash Messages**: Elegant success and error notifications

## Getting Started

### Prerequisites
- Ruby 3.3+
- Rails 8.0+
- PostgreSQL (recommended)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd llm_memory
```

2. Install dependencies:
```bash
bundle install
```

3. Set up the database:
```bash
bin/rails db:create
bin/rails db:migrate
```

4. Start the server:
```bash
bin/rails server
```

5. Visit `http://localhost:3000` in your browser

## Authentication Flow

### Registration
- Visit `/users/new` to create a new account
- Fill in email and password (minimum 6 characters)
- Confirm password and accept terms
- Automatically logged in after successful registration

### Login
- Visit `/` (root) to access the login page
- Enter email and password
- Optional "Remember me" checkbox
- Forgot password link available

### Password Reset
- Click "Forgot password?" on login page
- Enter email address
- Check email for reset instructions
- Set new password with confirmation

### Dashboard
- After successful authentication, redirected to `/dashboard`
- Beautiful welcome screen with user stats
- Quick action buttons for future features
- Sign out functionality

## Design Features

### Color Scheme
- **Primary**: White backgrounds for clean, modern look
- **Secondary**: Blue gradients for primary actions
- **Accent**: Various colors for different sections (green for registration, purple for password reset, orange for password edit)

### UI Components
- **Cards**: Rounded corners with subtle shadows
- **Gradients**: Beautiful gradient headers for each section
- **Icons**: SVG icons for visual appeal
- **Animations**: Smooth hover effects and transitions
- **Forms**: Clean, accessible form inputs with proper labels

### Responsive Design
- Mobile-first approach
- Flexible grid layouts
- Touch-friendly buttons and inputs
- Optimized spacing for all screen sizes

## File Structure

```
app/
├── controllers/
│   ├── application_controller.rb
│   ├── sessions_controller.rb
│   ├── users_controller.rb
│   ├── passwords_controller.rb
│   └── dashboard_controller.rb
├── models/
│   └── user.rb
├── views/
│   ├── sessions/
│   │   └── new.html.erb
│   ├── users/
│   │   └── new.html.erb
│   ├── passwords/
│   │   ├── new.html.erb
│   │   └── edit.html.erb
│   ├── dashboard/
│   │   └── index.html.erb
│   └── layouts/
│       └── application.html.erb
└── assets/
    └── stylesheets/
        └── application.css
```

## Customization

### Colors
The color scheme can be easily customized by modifying the Tailwind config in `application.html.erb`:

```javascript
tailwind.config = {
  theme: {
    extend: {
      colors: {
        primary: '#ffffff',
        secondary: '#3b82f6',
        accent: '#f1f5f9'
      }
    }
  }
}
```

### Animations
Custom CSS animations are defined in `app/assets/stylesheets/application.css` and can be modified to change the feel of the interface.

## Security Features

- **Password Security**: Bcrypt hashing with secure password validation
- **Rate Limiting**: Built-in protection against brute force attacks
- **CSRF Protection**: Rails built-in CSRF token protection
- **Session Security**: Secure session management
- **Input Validation**: Proper email and password validation

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License.

---

Built with ❤️ using Rails 8 and Tailwind CSS
