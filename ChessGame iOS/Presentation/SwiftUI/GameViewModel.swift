//
//  GameViewModel.swift
//  ChessGame iOS
//
//  Created by Eugene Kovs on 30.10.2023.
//

import Foundation

extension ChessBoard {
    
    func placeAll() {
        // Place white pawns
        for i in 8...15 {
            let pawn = Piece(type: .pawn, color: .white)
            let location = BoardLocation(index: i)
            placePiece(pawn, at: location)
        }
        
        // Place black pawns
        for i in 48...55 {
            let pawn = Piece(type: .pawn, color: .black)
            let location = BoardLocation(index: i)
            placePiece(pawn, at: location)
        }
        
        // Place rooks, knights, bishops, queen, and king for white
        placePiece(Piece(type: .rook, color: .white), at: BoardLocation(index: 0))
        placePiece(Piece(type: .knight, color: .white), at: BoardLocation(index: 1))
        placePiece(Piece(type: .bishop, color: .white), at: BoardLocation(index: 2))
        placePiece(Piece(type: .queen, color: .white), at: BoardLocation(index: 3))
        placePiece(Piece(type: .king, color: .white), at: BoardLocation(index: 4))
        placePiece(Piece(type: .bishop, color: .white), at: BoardLocation(index: 5))
        placePiece(Piece(type: .knight, color: .white), at: BoardLocation(index: 6))
        placePiece(Piece(type: .rook, color: .white), at: BoardLocation(index: 7))
        
        // Place rooks, knights, bishops, queen, and king for black
        placePiece(Piece(type: .rook, color: .black), at: BoardLocation(index: 56))
        placePiece(Piece(type: .knight, color: .black), at: BoardLocation(index: 57))
        placePiece(Piece(type: .bishop, color: .black), at: BoardLocation(index: 58))
        placePiece(Piece(type: .queen, color: .black), at: BoardLocation(index: 59))
        placePiece(Piece(type: .king, color: .black), at: BoardLocation(index: 60))
        placePiece(Piece(type: .bishop, color: .black), at: BoardLocation(index: 61))
        placePiece(Piece(type: .knight, color: .black), at: BoardLocation(index: 62))
        placePiece(Piece(type: .rook, color: .black), at: BoardLocation(index: 63))
    }
}
