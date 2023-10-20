//
//  Actions.swift
//  ChessGame iOS
//
//  Created by Eugene Kovs on 20.10.2023.
//

import Foundation

struct GameAction {
    internal enum ActionType {
        case movePiece
        case removePiece
        case transformPiece
    }
    
    internal let action: ActionType
    internal let piece: Piece
    internal let location: BoardLocation
    
    init(action: ActionType, piece: Piece, location: BoardLocation) {
        self.action = action
        self.piece = piece
        self.location = location
    }
}
