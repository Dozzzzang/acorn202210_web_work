package chat;

public class ChatDto {
	String chatName;
	String chatContent;
	String chatTime;	

	public ChatDto(String chatName, String chatContent, String chatTime) {
		super();
		this.chatName = chatName;
		this.chatContent = chatContent;
		this.chatTime = chatTime;
	}
	public String getChatName() {
		return chatName;
	}
	public void setChatName(String chatName) {
		this.chatName = chatName;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getChatTime() {
		return chatTime;
	}
	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}
}
