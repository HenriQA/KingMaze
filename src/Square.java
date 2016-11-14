
public class Square {

	//Attributes
	Piece occupier;
	
	//Constructor
	public Square(Piece occupier) {
		if(piece == [Pawn, Knight, Bishop, Rook, Queen, King, Empty]){
			this.occupier = occupier;
		}
		else {
			this.occupier = Empty;
		}
	//Methods

	//Getters and Setters
	public String getOccupier() {
		return occupier;
	}

	public void setOccupier(String occupier) {
		this.occupier = occupier;
	}

