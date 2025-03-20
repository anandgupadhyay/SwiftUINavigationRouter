//
//  BollywoodView.swift
//  GenericRouter
//
//  Created by Anand Upadhyay on 10 March 2025.
//

import SwiftUI

struct BollywoodView: View {
    
    @EnvironmentObject var router: MovieFlowRouter
    
    var body: some View {
        VStack {
            Button("Go to A") {
                router.navigate(to: .hollywood)
            }
        }
    }
}

struct HollywoodView: View {
    @EnvironmentObject var router: MovieFlowRouter
    
    var body: some View {
        VStack {
            Button("Go to B") {
                router.navigateToRoot()
            }
        }
    }
}

#Preview {
    BollywoodView()
}
