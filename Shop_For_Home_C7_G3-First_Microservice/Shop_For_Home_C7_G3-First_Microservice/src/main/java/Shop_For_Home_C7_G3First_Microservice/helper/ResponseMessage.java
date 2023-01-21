package Shop_For_Home_C7_G3First_Microservice.helper;

public class ResponseMessage {
	  private String message;
	  public ResponseMessage(String message) {
	    this.message = message;
	  }
	  public String getMessage() {
	    return message;
	  }
	  public void setMessage(String message) {
	    this.message = message;
	  }
	}