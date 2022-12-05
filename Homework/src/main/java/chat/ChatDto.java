package chat;

public class ChatDto {
	private int num;
	private String chatName;
	private String chatContent;
	
	public ChatDto() {}
	
	public int getNum() {
		return num;
	}



	public void setNum(int num) {
		this.num = num;
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



	public ChatDto(int num, String chatName, String chatContent) {
		super();
		this.num = num;
		this.chatName = chatName;
		this.chatContent = chatContent;
	}
}