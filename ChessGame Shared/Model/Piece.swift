//
//  Piece.swift
//  ChessGame iOS
//
//  Created by Eugene Kovs on 19.10.2023.
//

import SwiftUI

/*
 // TODO: - Tasks
 
 */

enum Color {
    case white
    case black
    
    var opposite: Color {
        return self == .white ? .black : .white
    }
}

struct Piece: Equatable {
    let type: PieceType
    let color: Color
    
    var image: String {
        switch type {
        case .pawn:
            return "\(color == .white ? "w" : "b")pawn"
        case .rook:
            return "\(color == .white ? "w" : "b")rook"
        case .knight:
            return "\(color == .white ? "w" : "b")knight"
        case .bishop:
            return "\(color == .white ? "w" : "b")bishop"
        case .queen:
            return "\(color == .white ? "w" : "b")queen"
        case .king:
            return "\(color == .white ? "w" : "b")king"
        }
    }
    
    public internal(set) var tag: Int!
    public internal(set) var hasMoved = false
    public internal(set) var canBeTakenByEnPassant = false
    public internal(set) var location = BoardLocation(index: 0)
    
    /// A property to store whether the piece is currently selected by the player. This property can be used to highlight the selected piece on the chessboard.
    var isSelected: Bool {
        didSet {
            // Perform any additional actions when the isSelected property is set
            // For example, you can update the UI to highlight the selected piece
        }
    }
    
    /// A property to store whether the piece is currently in a threatened position. This property can be used to indicate if the piece is under attack by an opponent's piece.
    var isThreatened: Bool {
        didSet {
            // Perform any additional actions when the isThreatened property is set
            // For example, you can update the UI to indicate if the piece is under attack
        }
    }
    
    /// A property to store whether the piece has been captured. This property can be used to remove the piece from the chessboard when it is captured by an opponent's piece.
    var isCaptured: Bool {
        didSet {
            // Perform any additional actions when the isCaptured property is set
            // For example, you can remove the piece from the chessboard
        }
    }
    
    public init(type: PieceType, color: Color, tag: Int = 0, isSelected: Bool = false, isThreatened: Bool = false, isCaptured: Bool = false) {
        self.type = type
        self.color = color
        self.tag = tag
        self.isSelected = isSelected
        self.isThreatened = isThreatened
        self.isCaptured = isCaptured
    }
}


public enum PieceType: Int {
    case pawn
    case rook
    case knight
    case bishop
    case queen
    case king
    
    var value: Double {
        switch self {
        case .pawn: return 1
        case .rook: return 5
        case .knight: return 3
        case .bishop: return 3
        case .queen: return 9
        case .king: return 0 // King is always treated as a unique case
        }
    }
    
    static func possiblePawnPromotionResultingTypes() -> [PieceType] {
        return [.queen, .knight, .rook, .bishop]
    }
}


extension Piece {
    /// A method to calculate the possible moves for each type of chess piece.
    func calculatePossibleMoves(board: [[Piece?]]) -> [BoardLocation] {
        var possibleMoves: [BoardLocation] = []
        
        let x = self.location.index % 8
        let y = (self.location.index / 8)
        
        switch self.type {
        case .pawn:
            // Pawns can move forward one square, if that square is unoccupied.
            // If it has not yet moved, the pawn has the option of moving two squares forward, provided both squares in front of the pawn are unoccupied.
            // A pawn cannot move forward if there is another piece directly in front of it.
            // Pawns are the only pieces that capture differently from how they move. They can capture an enemy piece on either of the two spaces adjacent to the space in front of them, but cannot move to these spaces if they are vacant.
            // En passant: A pawn can capture an opponent's pawn that has just moved two squares forward, provided the pawn is on the same file and the opponent's pawn is on the square diagonally in front of the pawn.
            // Pawn promotion: A pawn can be promoted to a queen, rook, bishop, or knight when it reaches the opposite side of the board.
            if y > 0 {
                if board[y-1][x] == nil {
                    possibleMoves.append(BoardLocation(index: self.location.index - 8))
                    if y == 6 && board[y-2][x] == nil {
                        possibleMoves.append(BoardLocation(index: self.location.index - 16))
                    }
                }
                if x > 0 && board[y-1][x-1]?.color != self.color {
                    possibleMoves.append(BoardLocation(index: self.location.index - 9))
                }
                if x < 7 && board[y-1][x+1]?.color != self.color {
                    possibleMoves.append(BoardLocation(index: self.location.index - 7))
                }
            }
        case .rook:
            // Rooks can move any number of squares along any rank or file, but may not leap over other pieces.
            // Castling: A king and a rook can move at the same time if the king has not moved and the rook has not moved and the squares between them are unoccupied.
            for i in 1...7 {
                if x > i && board[y][x-i] == nil {
                    possibleMoves.append(BoardLocation(index: self.location.index - i))
                }
                if x < 7 - i && board[y][x+i] == nil {
                    possibleMoves.append(BoardLocation(index: self.location.index + i))
                }
                if y > i && board[y-i][x] == nil {
                    possibleMoves.append(BoardLocation(index: self.location.index - i*8))
                }
                if y < 7 - i && board[y+i][x] == nil {
                    possibleMoves.append(BoardLocation(index: self.location.index + i*8))
                }
            }
        case .knight:
            // Knights move to any of the squares immediately adjacent to it and then make one further step at a right angle. This two-step move is called a "knight's move."
            let knightMoves = [(1, 2), (2, 1), (2, -1), (1, -2), (-1, -2), (-2, -1), (-2, 1), (-1, 2)]
            for move in knightMoves {
                let newX = x + move.0
                let newY = y + move.1
                if newX >= 0 && newX < 8 && newY >= 0 && newY < 8 && board[newY][newX]?.color != self.color {
                    possibleMoves.append(BoardLocation(index: newY*8 + newX))
                }
            }
        case .bishop:
            // Bishops can move any number of squares diagonally.
            for i in 1...7 {
                if x > i && y > i && board[y-i][x-i] == nil {
                    possibleMoves.append(BoardLocation(index: self.location.index - i*9))
                }
                if x < 7 - i && y > i && board[y-i][x+i] == nil {
                    possibleMoves.append(BoardLocation(index: self.location.index - i*7))
                }
                if x > i && y < 7 - i && board[y+i][x-i] == nil {
                    possibleMoves.append(BoardLocation(index: self.location.index + i*7))
                }
                if x < 7 - i && y < 7 - i && board[y+i][x+i] == nil {
                    possibleMoves.append(BoardLocation(index: self.location.index + i*9))
                }
            }
        case .queen:
            // Queens can move any number of squares along a rank, file or diagonal.
            for i in 1...7 {
                if x > i && board[y][x-i] == nil {
                    possibleMoves.append(BoardLocation(index: self.location.index - i))
                }
                if x < 7 - i && board[y][x+i] == nil {
                    possibleMoves.append(BoardLocation(index: self.location.index + i))
                }
                if y > i && board[y-i][x] == nil {
                    possibleMoves.append(BoardLocation(index: self.location.index - i*8))
                }
                if y < 7 - i && board[y+i][x] == nil {
                    possibleMoves.append(BoardLocation(index: self.location.index + i*8))
                }
                if x < 7 - i && y < 7 - i && board[y+i][x+i] == nil {
                    possibleMoves.append(BoardLocation(index: self.location.index + i*9))
                }
            }
        case .king:
            // Kings can move one square in any direction: forward, backward, to the left, or to the right.
            // Castling: A king and a rook can move at the same time if the king has not moved and the rook has not moved and the squares between them are unoccupied.
            let kingMoves = [(0, 1), (1, 1), (1, 0), (1, -1), (0, -1), (-1, -1), (-1, 0), (-1, 1)]
            for move in kingMoves {
                let newX = x + move.0
                let newY = y + move.1
                if newX >= 0 && newX < 8 && newY >= 0 && newY < 8 && board[newY][newX]?.color != self.color {
                    possibleMoves.append(BoardLocation(index: newY*8 + newX))
                }
            }
        }
        
        return possibleMoves
    }
    
    /// A method to check if a move is valid for a specific piece.
    func isValidMove(destination: BoardLocation, board: [[Piece?]]) -> Bool {
        /*
         In this example, the isValidMove method is added as an extension to the Piece model. It takes the destination location and the current state of the board as parameters.
         
         Inside the method, the calculatePossibleMoves method is called to get the possible moves for the piece. The possibleMoves array is then checked to see if it contains the destination location. If the destination location is found in the possibleMoves array, it means that the move is valid and the method returns true. Otherwise, it returns false.
         
         You can use this method to check if a move is valid for a specific piece by calling it on an instance of the Piece model and passing in the destination location and the current state of the chessboard.
         */
        let possibleMoves = calculatePossibleMoves(board: board)
        return possibleMoves.contains(destination)
    }
    
    /// A method to update the location of the piece after a valid move. This method can be called when a player makes a move and updates the location property of the piece.
    mutating func updateLocation(to destination: BoardLocation) {
        /*
         Inside the method, the location property of the piece is updated to the destination location using the assignment operator.
         
         To use this method, you can call it on an instance of the Piece model after validating a move and passing in the destination location. This will update the location property of the piece to the new location.
         */
        self.location = destination
    }
    
    func getPieceAtLocation(_ location: BoardLocation) -> Piece? {
        // Implement your logic to retrieve the piece at the given location from your game state
        // Return the piece if it exists, otherwise return nil
        return nil
    }
    
    
}
