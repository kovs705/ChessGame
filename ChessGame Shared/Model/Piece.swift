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
        let possibleMoves: [BoardLocation] = [] // var
        
        switch self.type {
        case .pawn:
            // Logic for calculating possible moves for a pawn
            break
        case .rook:
            // Logic for calculating possible moves for a rook
            break
        case .knight:
            // Logic for calculating possible moves for a knight
            break
        case .bishop:
            // Logic for calculating possible moves for a bishop
            break
        case .queen:
            // Logic for calculating possible moves for a queen
            break
        case .king:
            // Logic for calculating possible moves for a king
            break
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
