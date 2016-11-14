
public class Console {

	//Attributes
	String consoleName;
	Square[][] chessBoard;
	int boardSize;

	//Constructor
	public Console(string consoleName){
		
		this.consoleName = consoleName;
		this.boardSize = 8;
		this.chessBoard = new Square[boardSize][boardSize];
		for(int i = 0; i<boardSize; i++){
			for(int j = 0; j<boardSize; j++){
				chessBoard[i][j] = new Square();
			}
		}
	}

	//Methods
	
	//Move method
	
	// Getters and Setters

	//Stalemate check

	//Checkmate check

