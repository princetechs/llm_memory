# AI Chat System

This application now includes a fully functional AI chat system powered by RubyLLM and integrated with your existing authentication system.

## Features

- **User Authentication**: Chats are associated with authenticated users
- **AI Integration**: Powered by RubyLLM with support for multiple AI models
- **Conversation History**: Persistent chat history stored in the database
- **Modern UI**: Beautiful Tailwind UI with your default color theme
- **Responsive Design**: Works on desktop and mobile devices
- **Real-time Updates**: Immediate feedback and loading states

## How to Use

### 1. Access Chat System
- Click the "AI Chat" button on your dashboard
- Or use the navigation header to access "AI Chat"

### 2. Start a New Chat
- Click "New Chat" to begin a fresh conversation
- Each chat is automatically associated with your user account

### 3. Send Messages
- Type your message in the text area
- Click "Send" or press Enter
- The AI will respond using the configured model (default: GPT-4O)

### 4. View Chat History
- All your previous chats are listed on the chats index page
- Click on any chat to continue the conversation
- Messages are displayed with clear user/AI distinction

## Technical Details

### Database Schema
- `chats` table: Stores chat sessions with user association
- `messages` table: Stores individual messages with role and content
- `users` table: Your existing user authentication system

### Controllers
- `ChatsController`: Manages chat creation and display
- `MessagesController`: Handles message creation and AI responses

### Models
- `Chat`: Uses `acts_as_chat` from RubyLLM
- `Message`: Uses `acts_as_message` from RubyLLM
- `User`: Enhanced with chat associations

### Views
- `chats/index.html.erb`: List of all user chats
- `chats/show.html.erb`: Individual chat conversation view
- Enhanced dashboard with chat integration

## Configuration

### RubyLLM Setup
The system is configured to use:
- OpenAI API (GPT-4O) as the default model
- Anthropic API support (if configured)
- Automatic conversation context management

### Environment Variables
Make sure you have these set in your `.env` file:
```
OPENAI_API_KEY=your_openai_api_key_here
ANTHROPIC_API_KEY=your_anthropic_api_key_here
```

## Customization

### Changing Default Model
Edit `app/controllers/chats_controller.rb`:
```ruby
def create
  @chat = Current.user.chats.create!(model_id: 'your-preferred-model')
  redirect_to @chat
end
```

### UI Customization
- Colors: Modify Tailwind classes in the view files
- Layout: Adjust the responsive grid and spacing
- Icons: Replace SVG icons with your preferred set

## Security Features

- User authentication required for all chat operations
- Users can only access their own chats
- CSRF protection enabled
- Secure session management

## Performance Considerations

- Messages are paginated and loaded efficiently
- Database queries are optimized with proper associations
- Loading states provide user feedback during AI processing

## Troubleshooting

### Common Issues

1. **AI Not Responding**: Check your API keys and internet connection
2. **Chats Not Loading**: Ensure you're authenticated and have proper database access
3. **Styling Issues**: Verify Tailwind CSS is properly loaded

### Debug Mode
Enable debug logging in `config/environments/development.rb`:
```ruby
config.log_level = :debug
```

## Future Enhancements

- Streaming responses for real-time chat experience
- File upload support for images and documents
- Chat export functionality
- Advanced AI model selection
- Conversation search and filtering
- Chat templates and presets

---

For technical support or questions, refer to the RubyLLM documentation at [https://rubyllm.com/chat/](https://rubyllm.com/chat/)
