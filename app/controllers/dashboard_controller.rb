class DashboardController < ApplicationController
  def index
    @user = Current.user
    @memory_service = MemoryService.new(@user)
    @memory_stats = @memory_service.get_stats
    @profile_summary = @memory_service.get_profile_summary
    @recent_memories = @memory_service.get_relevant_memories(limit: 5)
  end
end
