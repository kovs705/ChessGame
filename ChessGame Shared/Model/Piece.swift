//
//  Piece.swift
//  ChessGame iOS
//
//  Created by Eugene Kovs on 19.10.2023.
//

import SwiftUI


struct Piece: Equatable {
    let type: PieceType
    let color: Color
    
    public internal(set) var tag: Int!
    public internal(set) var hasMoved = false
    public internal(set) var canBeTakenByEnPassant = false
    public internal(set) var location = BoardLocation(index: 0)
    
    public init(type: PieceType, color: Color, tag: Int = 0) {
        self.type = type
        self.color = color
        self.tag = tag
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
