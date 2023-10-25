//
//  BoardPosition.swift
//  ChessGame iOS
//
//  Created by Eugene Kovs on 19.10.2023.
//

import SwiftUI

/*
 // TODO: - Tasks
 1. A method to move a piece from one board location to another. This method can take the destination board location as a parameter and handle the logic of moving the piece from the current location to the destination location.
 */

// MARK: - ChessBoard
struct ChessBoard {
    /// A property to store the piece that is currently occupying the board location.
    var pieces: [BoardLocation: Piece] = [:]
    
    /// A method to check if a board location is empty.
    func isLocationEmpty(_ location: BoardLocation) -> Bool {
        return pieces[location] == nil
    }
    
    /// A method to place a piece on the board location.
    mutating func placePiece(_ piece: Piece, at location: BoardLocation) {
        pieces[location] = piece
    }
    
    /// A method to remove a piece from the board location.
    mutating func removePiece(at location: BoardLocation) {
        pieces[location] = nil
    }
    
    mutating func makeMove(from source: BoardLocation, to destination: BoardLocation) -> Bool {
        guard let piece = pieces[source] else {
            return false // No piece found at the source location
        }
        
        // Check if the destination location is empty or contains an opponent's piece
        if isLocationEmpty(destination) || pieces[destination]?.color != piece.color.opposite {
            pieces[destination] = piece
            pieces[source] = nil
            return true // Move successful
        }
        
        return false // Invalid move
    }
    
    /*
     var chessboard = Chessboard()

     let piece = Piece(name: "Pawn") // Assuming you have a Piece struct with a name property

     let location = BoardLocation(gridPosition: .a2)

     chessboard.placePiece(piece, at: location)

     print(chessboard.pieces) // Output: [BoardLocation(index: 8): Piece(name: "Pawn")]

     chessboard.removePiece(at: location)

     print(chessboard.pieces) // Output: [:]
     */
}

// MARK: - BoardLocation
struct BoardLocation: Equatable, Hashable {
    
    public enum GridPosition: Int {
        case a1; case b1; case c1; case d1; case e1; case f1; case g1; case h1
        case a2; case b2; case c2; case d2; case e2; case f2; case g2; case h2
        case a3; case b3; case c3; case d3; case e3; case f3; case g3; case h3
        case a4; case b4; case c4; case d4; case e4; case f4; case g4; case h4
        case a5; case b5; case c5; case d5; case e5; case f5; case g5; case h5
        case a6; case b6; case c6; case d6; case e6; case f6; case g6; case h6
        case a7; case b7; case c7; case d7; case e7; case f7; case g7; case h7
        case a8; case b8; case c8; case d8; case e8; case f8; case g8; case h8
    }
    
    public var index: Int
    
    public var isDarkSquare: Bool {
        return (index + y) % 2 == 0
    }
    
    public var x: Int {
        return index % 8
    }
    
    public var y: Int {
        return index / 8
    }
    
    public init(gridPosition: GridPosition) {
        self.index = gridPosition.rawValue
    }
    
    public init(index: Int) {
        self.index = index
    }
    
}
