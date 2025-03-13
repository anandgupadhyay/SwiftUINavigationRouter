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
            Button("Go to TollyWood") {
                router.navigate(to: .hollywood)
            }
        }
    }
}

struct HollywoodView: View {
    @EnvironmentObject var router: MovieFlowRouter
    
    var body: some View {
        VStack {
            Button("Go to Zoowies") {
                router.navigateToRoot()
            }
        }
    }
}

#Preview {
    BollywoodView()
}
