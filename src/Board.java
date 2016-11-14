
public class Board {

	//Attributes
	int boardSize;
	Square[][] chessBoard;	

	//Constructor
	public Board() {
	
		this.boardSize = 8;
		this.chessBoard = new Square[boardSize][boardSize];
		for(int i = 0; i<boardSize; i++){
			for(int j = 0; j<boardSize; j++){
				chessBoard[i][j] = new Square();
			}
		}
	}

	//Methods
	
	//Getters and Setters
	

