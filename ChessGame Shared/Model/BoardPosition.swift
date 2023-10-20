//
//  BoardPosition.swift
//  ChessGame iOS
//
//  Created by Eugene Kovs on 19.10.2023.
//

import SwiftUI

struct BoardLocation: Equatable {
    
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




