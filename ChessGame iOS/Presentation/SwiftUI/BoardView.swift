//
//  BoardView.swift
//  ChessGame iOS
//
//  Created by Eugene Kovs on 19.10.2023.
//

import SwiftUI

struct BoardView: View {
    
    @StateObject var chessBoard = ChessBoard()
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<8) { row in
                HStack(spacing: 0) {
                    ForEach(0..<8) { column in
                        ZStack {
                            Rectangle()
                                .foregroundColor(BoardLocation(index: row * 8 + column).isDarkSquare ? .brown.opacity(0.25) : .brown)
                                .frame(width: 45, height: 45)
                            
                            // Check if there's a piece at the current location
                            if let piece = chessBoard.pieces[BoardLocation(index: row * 8 + column)] {
                                Image(piece.image)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                        }
                    }
                }
            }
        }
        .overlay {
            Rectangle()
                .stroke(lineWidth: 2)
                .fill(.gray)
        }
        .onAppear {
            chessBoard.placeAll()
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
