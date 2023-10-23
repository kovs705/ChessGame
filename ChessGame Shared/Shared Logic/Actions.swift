//
//  Actions.swift
//  ChessGame iOS
//
//  Created by Eugene Kovs on 20.10.2023.
//

import Foundation

/*
 // TODO: - Tasks:
 
 */

struct GameAction {
    internal enum ActionType {
        case movePiece
        case removePiece
        case transformPiece
    }
    
    internal let action: ActionType
    internal let piece: Piece
    
    internal let location: BoardLocation
    internal let sourceLocation: BoardLocation
    internal let destinationLocation: BoardLocation
    
    internal let capturedPiece: Piece?
    internal let transformedPiece: Piece?
    
    /// Used to indicate if the action leads to a checkmate situation.
    internal let isCheckmate: Bool
    /// Used to indicate if the action leads to a stalemate situation.
    internal let isStalemate: Bool
    
    init(action: ActionType, piece: Piece, location: BoardLocation, sourceLocation: BoardLocation, destinationLocation: BoardLocation, capturedPiece: Piece? = nil, transformedPiece: Piece? = nil, isCheckmate: Bool, isStalemate: Bool) {
        self.action = action
        self.piece = piece
        self.isCheckmate = isCheckmate
        self.isStalemate = isStalemate
        
        self.location = location
        self.sourceLocation = sourceLocation
        self.destinationLocation = destinationLocation
        
        self.capturedPiece = capturedPiece
        self.transformedPiece = transformedPiece
    }
    
    
}
