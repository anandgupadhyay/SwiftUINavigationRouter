//
//  Untitled.swift
//  SwiftUINavigation
//
//  Created by Anand Upadhyay on 22/03/25.
//

import Foundation
import SwiftUI

struct LedBoardView: View {
    @State var show = false

    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image(.led)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .foregroundStyle(.orange)
                
                Text("SwiftUI")
                    .font(.system(size: 200))
                    .frame(height: 200)
                    .fixedSize()
                    .offset(x: geo.size.height/2)
                    .rotationEffect(.degrees(90))
                    .position(x: geo.size.width / 2)
                    .mask {
                        Image(.led)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width, height: geo.size.height)
                            .foregroundStyle(.yellow)
                    }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LedBoardView()
}

