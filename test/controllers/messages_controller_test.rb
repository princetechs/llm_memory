require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  include Authentication

  setup do
    @user = users(:one)
    @chat = @user.chats.create!(title: "Test Chat", model_id: "gpt-4o")
    sign_in_as(@user)
  end

  test "should create message and store memories" do
    # Mock the RubyLLM response
    mock_response = double(
      content: '{"response":"Hello! I remember you like programming.","memories":[{"content":"User enjoys programming","category":"personal_facts","importance":"medium","type":"user"}]}',
      model_id: "gpt-4o",
      input_tokens: 10,
      output_tokens: 20
    )

    RubyLLM.stub :chat, mock_chat(mock_response) do
      assert_difference('Message.count', 2) do
        post chat_messages_path(@chat), params: { message: { content: "Hello" } }
      end
    end

    assert_redirected_to @chat
    
    # Check that memories were stored
    memory_service = MemoryService.new(@user)
    memories = memory_service.memory.get
    assert_equal 1, memories.length
    assert_equal "User enjoys programming", memories.first['content']
  end

  test "should handle JSON parsing errors gracefully" do
    # Mock a malformed response
    mock_response = double(
      content: 'Invalid JSON response',
      model_id: "gpt-4o",
      input_tokens: 10,
      output_tokens: 20
    )

    RubyLLM.stub :chat, mock_chat(mock_response) do
      assert_difference('Message.count', 2) do
        post chat_messages_path(@chat), params: { message: { content: "Hello" } }
      end
    end

    assert_redirected_to @chat
    
    # Check that fallback memory was stored
    memory_service = MemoryService.new(@user)
    memories = memory_service.memory.get
    assert_equal 1, memories.length
    assert_includes memories.first['content'], "AI response (JSON parsing failed)"
  end

  private

  def mock_chat(mock_response)
    mock_chat = double
    allow(mock_chat).to receive(:with_instructions)
    allow(mock_chat).to receive(:with_params)
    allow(mock_chat).to receive(:on_new_message)
    allow(mock_chat).to receive(:instance_variable_get).and_return([])
    allow(mock_chat).to receive(:ask).and_return(mock_response)
    mock_chat
  end
end
