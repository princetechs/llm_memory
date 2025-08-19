class DebugController < ApplicationController
  before_action :set_memory_service

  def memory_status
    @memory_status = @memory_service.debug_memory_status
    @memories = @memory_service.memory.get.first(20)
    @stats = @memory_service.get_stats
    @profile = @memory_service.get_profile_memories
  end

  def test_memory_storage
    # Test storing different types of memories
    test_memories = [
      { content: "User likes coffee", category: "preferences", importance: "medium" },
      { content: "User is a software developer", category: "personal_facts", importance: "high" },
      { content: "User wants to learn AI", category: "goals", importance: "high" },
      { content: "User knows Ruby on Rails", category: "skills", importance: "medium" }
    ]

    results = []
    test_memories.each do |memory|
      result = @memory_service.store(
        memory[:content], 
        category: memory[:category], 
        importance: memory[:importance]
      )
      results << { memory: memory, result: result, success: !result.nil? }
    end

    @test_results = results
    @memory_status = @memory_service.debug_memory_status
    
    render :memory_status
  end

  def clear_memories
    # Clear all memories for testing
    memory_file = @memory_service.send(:user_memory_path)
    if File.exist?(memory_file)
      File.write(memory_file, JSON.pretty_generate({ 'memories' => [] }))
      flash[:notice] = "Memories cleared for testing"
    else
      flash[:error] = "Memory file not found"
    end
    
    redirect_to debug_memory_status_path
  end

  private

  def set_memory_service
    @memory_service = MemoryService.new(Current.user)
  end
end
