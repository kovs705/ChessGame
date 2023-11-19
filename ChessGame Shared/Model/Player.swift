//
//  Player.swift
//  ChessGame iOS
//
//  Created by Eugene Kovs on 19.10.2023.
//

import SwiftUI

/*
 // TODO: - Tasks:
 1. A method to check if the player is in checkmate. This method can analyze the current state of the chessboard and determine if the player's king is in checkmate, meaning there are no legal moves to escape check.
 2. A method to check if the player is in stalemate. This method can analyze the current state of the chessboard and determine if the player's king is in stalemate, meaning the player has no legal moves but is not in check.
 */

struct Player {
    let color: Color
    var isHuman: Bool
    var name: String
    var capturedPieces: [Piece]
    
    init(color: Color, isHuman: Bool, name: String) {
        self.color = color
        self.isHuman = isHuman
        self.name = name
        self.capturedPieces = []
    }
    
    /// A method to add a captured piece to the player's collection. This method can take a Piece object as a parameter and append it to the captured pieces array.
    mutating func addCapturedPiece(_ piece: Piece) {
        capturedPieces.append(piece)
    }
    
    /// A method to remove a captured piece from the player's collection. This method can take a Piece object as a parameter and remove it from the captured pieces array.
    mutating func removeCapturedPiece(_ piece: Piece) {
        if let index = capturedPieces.firstIndex(of: piece) {
            capturedPieces.remove(at: index)
        }
    }
    
    /// A method to check if the player is in checkmate. This method can analyze the current state of the chessboard and determine if the player's king is in checkmate, meaning there are no legal moves to escape check.
    func isInCheckmate(chessboard: ChessBoard) -> Bool {
        // Logic to analyze the current state of the chessboard and determine if the player's king is in checkmate
        // Return true if the player is in checkmate, false otherwise
        // You can implement your own logic here based on the rules of chess
        // This implementation assumes that the Chessboard struct has a method called `isKingInCheck(color:)` that checks if the king of the specified color is in check
        
        // Check if the player's king is in check
//        if chessboard.isKingInCheck(color: self.color) {
            // TODO: Implement logic to check if the player's king has any legal moves to escape check
            // If there are no legal moves to escape check, return true for checkmate
            // Otherwise, return false
//        }
        
        return false // Default return value, modify as needed
    }
    
    /// A method to check if the player is in stalemate. This method can analyze the current state of the chessboard and determine if the player's king is in stalemate, meaning the player has no legal moves but is not in check.
    func isInStalemate(chessboard: ChessBoard) -> Bool {
        // Logic to analyze the current state of the chessboard and determine if the player's king is in stalemate
        // Return true if the player is in stalemate, false otherwise
        // You can implement your own logic here based on the rules of chess
        // This implementation assumes that the Chessboard struct has a method called `isKingInCheck(color:)` that checks if the king of the specified color is in check
        
        // Check if the player's king is not in check
//        if !chessboard.isKingInCheck(color: self.color) {
            // TODO: Implement logic to check if the player has any legal moves
            // If there are no legal moves, return true for stalemate
            // Otherwise, return false
//        }
        
        return false // Default return value, modify as needed
    }
}


