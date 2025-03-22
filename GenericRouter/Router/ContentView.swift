import SwiftUI

//  Created by Anand Upadhyay on 10 March 2025.

/// ContentView contains a TabView to switch between Music and Movie flows
struct ContentView: View {
    var body: some View {
        TabView {
            Tab("C", systemImage: "music.note.house.fill") {
                MusicView()
            }
            
            Tab("B", systemImage: "movieclapper.fill") {
                MovieView()
            }
        }
    }
}

/// MusicView manages the Music flow and uses Router to handle navigation
struct MusicView: View {
    
    /// Router managing navigation between the screens
    @StateObject private var router = MusicFlowRouter()
    
    var body: some View {
        NavigationStack(path: $router.navPaths) {
            mainView
                .navigationDestination(for: MusicFlow.self) { destination in
                    destination
                        .destinationView
                    /// Dynamic title based on flow
                        .navigationTitle(destination.title)
                        .toolbarRole(.editor)
                }
        }
        /// Inject router for global navigation management
        .environmentObject(router)
    }
    
    private var mainView: some View {
        VStack {
            Button("Go to C") {
                router.navigate(to: .first) /// IMP
            }
        }
        .navigationTitle("D")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MOVIE FLOW
struct MovieView: View {
    
    @StateObject private var router = MovieFlowRouter()
    
    var body: some View {
        NavigationStack(path: $router.navPaths) {
            mainView
                .navigationDestination(for: MovieFlow.self) { destination in
                    destination.destinationView
                        .navigationTitle(destination.title)
                        .toolbarRole(.editor)
                }
        }
        .environmentObject(router)
    }
    
    private var mainView: some View {
        VStack {
            Button("Go to A") {
                router.navigate(to: .bollywood)
            }
        }
        .navigationTitle("B")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
