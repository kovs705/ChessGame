//
//  BoardView.swift
//  ChessGame iOS
//
//  Created by Eugene Kovs on 19.10.2023.
//

import SwiftUI

struct BoardView: View {
    
    @StateObject var chessBoard = ChessBoard()
    @State var selectedLocation: BoardLocation?
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<8) { row in
                HStack(spacing: 0) {
                    ForEach(0..<8) { column in
                        let location = BoardLocation(index: row * 8 + column)
                        let isPossibleMove = chessBoard.possibleMoves.contains(location)
                        ZStack {
                            Rectangle()
                               .foregroundColor(isPossibleMove ? .green : (location.isDarkSquare ? .brown.opacity(0.25) : .brown))
                               .frame(width: 45, height: 45)
                               .contentShape(Rectangle()) // Add this line
                            
                            // Check if there's a piece at the current location
                            if let piece = chessBoard.pieces[location] {
                                Image(piece.image)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                        }
                        .onTapGesture {
                            if let piece = chessBoard.pieces[location] {
                                print(piece)
                                withAnimation {
                                    chessBoard.selectPiece(at: location)
                                    selectedLocation = location
                                }
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
