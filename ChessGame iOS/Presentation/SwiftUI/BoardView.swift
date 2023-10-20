//
//  BoardView.swift
//  ChessGame iOS
//
//  Created by Eugene Kovs on 19.10.2023.
//

import SwiftUI

struct BoardView: View {
    var body: some View {
        createChessboard()
    }
    
    @ViewBuilder func createChessboard() -> some View {
        VStack(spacing: 0) {
            ForEach(0..<8) { row in
                HStack(spacing: 0) {
                    ForEach(0..<8) { column in
                        Rectangle()
                            .foregroundColor((row + column) % 2 == 0 ? .brown.opacity(0.25) : .brown)
                            .frame(width: 45, height: 45)
                    }
                }
            }
        }
        .overlay {
            Rectangle()
                .stroke(lineWidth: 2)
                .fill(Color.gray)
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
