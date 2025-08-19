# R2LM Gem - Quick Reference Guide

## 🚀 **Get Started in 30 Seconds**

```ruby
# 1. Add to Gemfile
gem 'r2lm', path: '../r2lm'

# 2. Initialize memory
memory = R2lm.profile("memories.json", user_id: 123)

# 3. Store and retrieve
memory.store_profile("User loves Ruby", category: 'preferences')
context = memory.build_context(query: "What do you know about me?")
```

## 📚 **Core Methods**

### **Basic Operations:**
```ruby
# Initialize
memory = R2lm.profile("path/to/memories.json", user_id: 123)

# Store memories
memory.store_profile("Content", category: 'name', importance: 'high')
memory.store_profile("Content")  # Auto-categorization

# Get all memories
all_memories = memory.get

# Get by category
name_memories = memory.by_category('name')
```

### **Smart Context Building:**
```ruby
# Get relevant context for AI prompts
context = memory.build_context(query: "What is my name?")
# => "Name: User's name is Alice"

context = memory.build_context(query: "What do I do for work?")
# => "Personal facts: You work as a developer | Skills: You know Ruby"
```

### **Profile Management:**
```ruby
# Get profile summary
profile = memory.get_profile_summary(limit: 10)

# Get relevant memories for query
relevant = memory.get_relevant_memories("work", limit: 5)

# Build conversation summary
summary = memory.build_conversation_summary(messages)
```

## 🎯 **Quick Helpers**

```ruby
# Quick operations
R2lm.remember(memory, "Content", category: 'preferences')
context = R2lm.recall(memory, query: "What are preferences?")
summary = R2lm.summarize(memory, conversation_messages)

# Quick setup
memory = R2lm.setup("/app/storage", user_id: 123)
```

## 🏗️ **Integration Examples**

### **Rails Controller:**
```ruby
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

### **Sinatra App:**
```ruby
get '/chat' do
  memory = R2lm.profile("memories.json", user_id: session[:user_id])
  context = memory.build_context(query: params[:message])
  
  ai_response = generate_response(context, params[:message])
  memory.store_profile(extract_facts(ai_response))
  
  ai_response
end
```

### **CLI Tool:**
```ruby
#!/usr/bin/env ruby
require 'r2lm'

memory = R2lm.profile("~/.memories.json")

case ARGV[0]
when 'remember'
  memory.store_profile(ARGV[1], category: ARGV[2])
when 'recall'
  puts memory.build_context(query: ARGV[1])
end
```

## 🎨 **Memory Categories**

### **Auto-Detected Categories:**
- **`name`** - Personal identification
- **`personal_facts`** - Work, experience, background
- **`preferences`** - Likes, dislikes, choices
- **`goals`** - Aspirations, plans, dreams
- **`skills`** - Knowledge, expertise, abilities
- **`projects`** - Work, creations, developments
- **`events`** - Important dates, milestones
- **`friends`** - Relationships
- **`family`** - Family relationships
- **`conversation`** - Chat history

### **Custom Categories:**
```ruby
# Override auto-detection
memory.store_profile("Content", category: 'custom_category')
```

## ⚡ **Performance Tips**

### **Token Optimization:**
```ruby
# Limit context size
context = memory.build_context(query: query, limit: 5)

# Use conversation summaries
summary = memory.build_conversation_summary(messages, limit: 3)

# Get only high-priority memories
profile = memory.get_profile_summary(limit: 10)
```

### **Storage Optimization:**
```ruby
# Use user-specific files
memory = R2lm.profile("user_#{user_id}_memories.json", user_id: user_id)

# Store in organized directories
memory = R2lm.setup("/app/storage/memories", user_id: user_id)
```

## 🔍 **Debugging**

### **Memory Status:**
```ruby
# Check memory file status
status = memory.debug_memory_status
puts "File: #{status[:file_path]}"
puts "Count: #{status[:memory_count]}"
puts "Categories: #{status[:categories]}"
```

### **Common Issues:**
```ruby
# Memory not persisting? Check file path
puts memory.file_path

# No memories found? Check file exists
puts File.exist?(memory.file_path)

# Categories empty? Check memory content
puts memory.get.map { |m| m['category'] }.uniq
```

## 📊 **Data Structure**

### **Memory Object:**
```ruby
{
  'id' => 'uuid',
  'content' => 'Memory content',
  'category' => 'name',
  'importance' => 'high',
  'tags' => ['user_123', 'auto_discovered'],
  'created_at' => '2024-01-01T00:00:00Z'
}
```

### **Context Format:**
```ruby
# Compact context string
"Name: Alice | Job: Developer | Skills: Ruby, React"

# Profile summary array
[
  { 'content' => 'Alice', 'category' => 'name', 'importance' => 'high' },
  { 'content' => 'Developer', 'category' => 'personal_facts', 'importance' => 'high' }
]
```

## 🚀 **Advanced Usage**

### **Custom Memory Classes:**
```ruby
class CustomMemory < R2lm::ProfileMemory
  CUSTOM_CATEGORIES = %w[health fitness travel].freeze
  
  def detect_category(content)
    super || custom_detection(content)
  end
end
```

### **Batch Operations:**
```ruby
# Store multiple memories
memories.each do |memory_data|
  memory.store_profile(
    memory_data[:content],
    category: memory_data[:category],
    importance: memory_data[:importance]
  )
end
```

### **Memory Search:**
```ruby
# Search by content
results = memory.search(query: "ruby")

# Search by category
results = memory.search(category: "skills")

# Search by importance
results = memory.search(importance: "high")
```

## 📚 **Full Documentation**

- **Complete Guide**: See `PROJECT_DOCUMENTATION.md`
- **Gem README**: See `r2lm/README.md`
- **Examples**: See `r2lm/spec/` for test cases
- **Implementation**: See `llm_memory/` for full Rails app

---

**R2LM Gem**: Transform any Ruby app into an AI-powered, memory-enabled system in minutes! 🚀
