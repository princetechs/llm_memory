class MemoriesController < ApplicationController
  before_action :set_memory_service

  def index
    @memories = @memory_service.get_relevant_memories(limit: 50)
    @stats = @memory_service.get_stats
    @profile_summary = @memory_service.get_profile_summary
  end

  def show
    # Get specific memory by ID (if needed)
    @memory = @memory_service.get_relevant_memories(query: params[:id]).first
    redirect_to memories_path, notice: "Memory not found" unless @memory
  end

  def search
    query = params[:query]
    category = params[:category]
    
    @memories = @memory_service.get_relevant_memories(
      query: query,
      category: category,
      limit: 25
    )
    
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @memories }
    end
  end

  def update_importance
    memory_id = params[:id]
    new_importance = params[:importance]
    
    if %w[low medium high].include?(new_importance)
      @memory_service.update_memory_importance(memory_id, new_importance)
      redirect_to memories_path, notice: "Memory importance updated"
    else
      redirect_to memories_path, alert: "Invalid importance level"
    end
  end

  def export
    memories = @memory_service.get_relevant_memories(limit: 1000)
    
    respond_to do |format|
      format.json do
        send_data memories.to_json, 
                  filename: "memories_#{Current.user.id}_#{Date.current}.json",
                  type: 'application/json'
      end
      format.csv do
        csv_data = generate_csv(memories)
        send_data csv_data,
                  filename: "memories_#{Current.user.id}_#{Date.current}.csv",
                  type: 'text/csv'
      end
    end
  end

  private

  def set_memory_service
    @memory_service = MemoryService.new(Current.user)
  end

  def generate_csv(memories)
    require 'csv'
    
    CSV.generate do |csv|
      csv << ['Content', 'Category', 'Importance', 'Tags', 'Created At', 'Updated At']
      
      memories.each do |memory|
        csv << [
          memory['content'],
          memory['category'],
          memory['importance'],
          memory['tags']&.join(', '),
          memory['created_at'],
          memory['updated_at']
        ]
      end
    end
  end
end
