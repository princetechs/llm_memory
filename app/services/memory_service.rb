require 'fileutils'

class MemoryService
  def initialize(user)
    @user = user
    ensure_storage_directory
    # Use the new factory-based ProfileMemory from r2lm gem
    @memory = R2lm.profile(user_memory_path, user_id: user.id)
    Rails.logger.info "MemoryService initialized for user #{user.id} at #{user_memory_path}"
  end

  # Simple store method using r2lm ProfileMemory
  def store(content, category: nil, importance: 'medium', tags: [])
    @memory.store_profile(content, category: category, importance: importance, tags: tags)
  end

  # Get profile memories using r2lm gem
  def get_profile_memories(limit: 10)
    begin
      memories = @memory.get_profile_summary(limit: limit)
      Rails.logger.info "Retrieved #{memories.length} profile memories using r2lm ProfileMemory"
      memories
    rescue => e
      Rails.logger.error "Failed to get profile memories: #{e.message}"
      []
    end
  end

  # Get memory statistics
  def get_stats
    begin
      {
        total_memories: @memory.count,
        categories: @memory.categories,
        tags: @memory.tags,
        by_importance: {
          high: @memory.by_importance('high').count,
          medium: @memory.by_importance('medium').count,
          low: @memory.by_importance('low').count
        }
      }
    rescue => e
      Rails.logger.error "Failed to get memory stats: #{e.message}"
      {}
    end
  end

  # Get the memory instance for direct access
  attr_reader :memory

  # Debug method to check memory file status
  def debug_memory_status
    {
      file_path: user_memory_path,
      file_exists: File.exist?(user_memory_path),
      file_size: File.exist?(user_memory_path) ? File.size(user_memory_path) : 0,
      memory_count: @memory.count,
      categories: @memory.categories,
      sample_memories: @memory.get.first(3)
    }
  end

  private

  def user_memory_path
    # Store memories in user-specific files
    File.join(Rails.root, 'storage', 'memories', "user_#{@user.id}_memories.json")
  end

  def ensure_storage_directory
    storage_dir = File.dirname(user_memory_path)
    unless Dir.exist?(storage_dir)
      FileUtils.mkdir_p(storage_dir)
      Rails.logger.info "Created storage directory: #{storage_dir}"
    end
  end


end
