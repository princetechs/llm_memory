class DashboardController < ApplicationController
  def index
    @user = Current.user
    @memory_service = MemoryService.new(@user)
    @memory_stats = @memory_service.get_stats
    @profile_summary = @memory_service.get_profile_memories(limit: 10)
    @recent_memories = @memory_service.memory.get.first(5)
  end
end
