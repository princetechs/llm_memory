# LLM Memory - AI-Powered Profile-Based Memory Management

[![Ruby](https://img.shields.io/badge/Ruby-3.4+-red.svg)](https://ruby-lang.org)
[![Rails](https://img.shields.io/badge/Rails-8.0+-blue.svg)](https://rubyonrails.org)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> **Transform any Ruby application into an AI-powered, memory-enabled system with just 3 lines of code!**

## 🎯 **What is LLM Memory?**

**LLM Memory** is a Rails application that demonstrates how to build AI-powered applications with **long-term, profile-based memory management**. The core innovation is the **`r2lm` gem** - a universal Ruby gem that any project can use to implement intelligent memory systems.

### **The Problem We Solve:**
Traditional AI chatbots have **no memory** - they forget everything after each conversation, leading to:
- ❌ Repetitive interactions
- ❌ No personalization  
- ❌ Poor user experience
- ❌ High token costs

### **Our Solution:**
**Profile-based memory management** that:
- ✅ Remembers users across chat sessions
- ✅ Learns preferences and personal details automatically
- ✅ Provides context to AI for personalized responses
- ✅ Reduces token costs through smart memory compression
- ✅ Works universally - any Ruby project can use it

## 🚀 **Quick Start (30 seconds!)**

```ruby
# 1. Add to Gemfile
gem 'r2lm', path: '../r2lm'

# 2. Initialize memory
memory = R2lm.profile("memories.json", user_id: 123)

# 3. Store and retrieve
memory.store_profile("User loves Ruby", category: 'preferences')
context = memory.build_context(query: "What do you know about me?")
# => "Preferences: User loves Ruby"
```

## 🏗️ **Architecture**

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Rails App     │    │   R2LM Gem      │    │   AI Service    │
│                 │    │                 │    │                 │
│ • Chat UI       │◄──►│ • ProfileMemory │◄──►│ • GPT-4o        │
│ • User Auth     │    │ • Auto-category │    │ • Memory-aware  │
│ • Memory Debug  │    │ • Smart context │    │ • Personalized  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### **Core Components:**

- **`r2lm/`** - Universal memory management gem
- **`llm_memory/`** - Rails application demonstrating the gem
- **Profile-based memory** - Smart categorization and retrieval
- **Token optimization** - 60-70% reduction in AI costs

## 🔧 **Features**

### **🎯 Smart Memory Management:**
- **Automatic categorization** of user information
- **Query-aware retrieval** - only relevant memories included
- **Importance-based sorting** - high-priority memories first
- **Persistent storage** across chat sessions

### **⚡ Performance Optimization:**
- **Compact context building** for AI prompts
- **Conversation summarization** instead of full history
- **Smart memory filtering** based on user questions
- **Efficient JSON storage** with minimal overhead

### **🌍 Universal Interface:**
- **Any Ruby project** can use it
- **Minimal code changes** required
- **Clean, simple API** for developers
- **Comprehensive documentation** and examples

## 📚 **Documentation**

- **[Project Documentation](PROJECT_DOCUMENTATION.md)** - Comprehensive guide to the project
- **[Quick Reference](QUICK_REFERENCE.md)** - Developer quick reference guide
- **[R2LM Gem README](../r2lm/README.md)** - Detailed gem usage documentation
- **[Examples](../r2lm/spec/)** - Test cases and usage patterns

## 🚀 **Getting Started**

### **Prerequisites:**
- Ruby 3.4+
- Rails 8.0+
- Node.js (for asset compilation)

### **Installation:**

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/rubylm.git
   cd rubylm/llm_memory
   ```

2. **Install dependencies:**
   ```bash
   bundle install
   npm install
   ```

3. **Setup database:**
   ```bash
   rails db:create db:migrate
   ```

4. **Start the server:**
   ```bash
   rails server
   ```

5. **Visit the application:**
   ```
   http://localhost:3000
   ```

### **Using the R2LM Gem in Your Project:**

```ruby
# In your Gemfile
gem 'r2lm', path: '../r2lm'

# In your application
require 'r2lm'

class ChatController < ApplicationController
  def create
    memory = R2lm.profile("memories.json", user_id: current_user.id)
    
    # Get context for AI
    context = memory.build_context(query: params[:message])
    
    # Send to AI with context
    ai_response = send_to_ai(context, params[:message])
    
    # Store new facts
    memory.store_profile(extract_facts(ai_response))
    
    render json: { response: ai_response }
  end
end
```

## 🎨 **Memory Categories**

R2LM automatically categorizes user information:

- **`name`** - Personal identification
- **`personal_facts`** - Work, experience, background
- **`preferences`** - Likes, dislikes, choices
- **`goals`** - Aspirations, plans, dreams
- **`skills`** - Knowledge, expertise, abilities
- **`projects`** - Work, creations, developments
- **`events`** - Important dates, milestones
- **`friends`** - Relationships
- **`family`** - Family relationships
- **`conversation`** - Chat history summaries

## 📊 **Performance & Token Optimization**

### **Token Savings:**
- **Before**: 500+ tokens per request (full memory dump + chat history)
- **After**: 150-200 tokens per request (compressed context + summary)
- **Result**: **60-70% reduction** in token usage

### **Smart Features:**
- **Compact context**: "Name: Alice | Job: Developer | Skills: Ruby"
- **Query-aware**: Only relevant memories included
- **Importance-based**: High-priority memories prioritized
- **Conversation summary**: 3-line summary instead of full history

## 🔍 **Use Cases**

### **1. Customer Support Chatbots**
- Remember customer preferences and history
- Provide personalized support responses
- Learn from customer interactions

### **2. Educational AI Tutors**
- Remember student progress and skills
- Adapt lessons based on learning history
- Track goals and achievements

### **3. Personal AI Assistants**
- Remember user preferences and habits
- Provide personalized recommendations
- Learn user patterns over time

### **4. Business AI Tools**
- Remember client relationships and history
- Track project progress and deadlines
- Learn business processes and preferences

## 🧪 **Testing**

### **Run the test suite:**
```bash
# Test the Rails application
rails test

# Test the R2LM gem
cd ../r2lm
bundle exec rspec
```

### **Test memory functionality:**
```bash
# Start the server
rails server

# Visit debug page
http://localhost:3000/debug/memory_status

# Test memory storage
http://localhost:3000/debug/test_memory_storage
```

## 🚀 **Deployment**

### **Production Considerations:**
- **Storage**: Consider moving from file-based to database storage
- **Scaling**: Implement memory caching for high-traffic applications
- **Security**: Ensure proper user isolation and data privacy
- **Monitoring**: Track memory usage and AI response quality

### **Environment Variables:**
```bash
# Set memory storage path
export R2LM_MEMORY_PATH="/app/storage/memories"

# Set AI service credentials
export OPENAI_API_KEY="your-api-key"
```

## 🤝 **Contributing**

We welcome contributions! Here's how to get started:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/amazing-feature`)
3. **Make your changes**
4. **Add tests** for new functionality
5. **Commit your changes** (`git commit -m 'Add amazing feature'`)
6. **Push to the branch** (`git push origin feature/amazing-feature`)
7. **Open a Pull Request**

### **Development Setup:**
```bash
# Clone and setup
git clone https://github.com/yourusername/rubylm.git
cd rubylm

# Setup both projects
cd r2lm && bundle install
cd ../llm_memory && bundle install

# Run tests
cd ../r2lm && bundle exec rspec
cd ../llm_memory && rails test
```

## 📄 **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 **Acknowledgments**

- **Rails team** for the amazing framework
- **OpenAI** for the GPT models that power the AI
- **Ruby community** for inspiration and support

## 📞 **Support & Questions**

- **Issues**: [GitHub Issues](https://github.com/yourusername/rubylm/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/rubylm/discussions)
- **Documentation**: See the [documentation files](PROJECT_DOCUMENTATION.md)

---

## 🌟 **Why This Project is Revolutionary**

**R2LM transforms any Ruby application into an AI-powered, memory-enabled system with minimal code changes.**

### **Before R2LM:**
- ❌ AI forgot everything after each chat
- ❌ No personalization or context
- ❌ High token costs from repetition
- ❌ Poor user experience
- ❌ Complex memory implementations

### **With R2LM:**
- ✅ **Universal solution** - Any Ruby project can use it
- ✅ **Profile-based memory** - AI remembers users personally
- ✅ **Token optimization** - 60-70% cost reduction
- ✅ **Simple integration** - Just 3 lines of code
- ✅ **Smart categorization** - Automatic memory organization
- ✅ **Persistent storage** - Memories last across sessions

**Start building AI applications that actually remember your users! 🚀**

---

*Built with ❤️ using Ruby, Rails, and the power of AI memory management.*
