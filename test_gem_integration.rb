#!/usr/bin/env ruby

# Test the new r2lm gem integration
require_relative 'config/environment'

puts "Testing R2LM Gem Integration..."
puts "=" * 60

# Test the new ProfileMemory directly
puts "\n1. Testing R2LM::ProfileMemory directly..."

# Create a test memory instance
test_memory = R2lm::ProfileMemory.new("test_memories.json", user_id: 999)

# Store some test memories
test_memory.store_profile("Test user's name is Alice", category: 'name', importance: 'high')
test_memory.store_profile("Test user works as a designer", category: 'personal_facts', importance: 'high')
test_memory.store_profile("Test user loves Ruby", category: 'preferences', importance: 'medium')

puts "Stored 3 test memories"

# Test context building
context = test_memory.build_context(query: "What is the user's name?")
puts "\nQuery: 'What is the user's name?'"
puts "Context: #{context}"

context = test_memory.build_context(query: "What does the user do?")
puts "\nQuery: 'What does the user do?'"
puts "Context: #{context}"

# Test conversation summary
messages = [
  { role: 'user', content: 'What is my name?' },
  { role: 'assistant', content: 'Your name is Alice!' }
]

summary = test_memory.build_conversation_summary(messages)
puts "\nConversation summary: #{summary}"

# Test the interface helpers
puts "\n2. Testing R2LM interface helpers..."

memory = R2lm.profile("test_memories.json", user_id: 999)
R2lm.remember(memory, "Test user knows Photoshop", category: 'skills')
context = R2lm.recall(memory, query: "What are the user's skills?")
puts "Skills context: #{context}"

# Test with MemoryService
puts "\n3. Testing MemoryService integration..."

# Create a test user
test_user = User.first || User.create!(
  email_address: "test_#{Time.now.to_i}@example.com",
  password: "password123"
)

memory_service = MemoryService.new(test_user)

# Store memories through the service
memory_service.store("User's name is Bob", category: 'name', importance: 'high')
memory_service.store("User works as a developer", category: 'personal_facts', importance: 'high')
memory_service.store("User loves programming", category: 'preferences', importance: 'medium')

puts "Stored memories through MemoryService"

# Get profile memories
profile_memories = memory_service.get_profile_memories
puts "Retrieved #{profile_memories.length} profile memories"

# Build context through the service
context = memory_service.memory.build_context(query: "What do you know about me?")
puts "Service context: #{context}"

# Clean up test files
File.delete("test_memories.json") if File.exist?("test_memories.json")

puts "\n✅ R2LM gem integration test completed!"
puts "=" * 60

