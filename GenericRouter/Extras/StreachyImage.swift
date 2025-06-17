import SwiftUI

// A struct representing a Flower with a name property
struct Flower {
    let name: String
}

// FlowerView: A SwiftUI View that displays a flower image in a scrollable view with a stretchy header effect
struct FlowerView: View {
    let flower: Flower // The flower to display
    
    var body: some View {
        // ScrollView to enable vertical scrolling
        ScrollView {
            // VStack to stack the image and additional content vertically
            VStack {
                // Display the flower image
                Image(flower.name)
                    .resizable() // Make the image resizable
                    .scaledToFill() // Scale the image to fill the frame while maintaining aspect ratio
                    .stretchy() // Apply the custom stretchy effect modifier
                // Placeholder for additional content (e.g., flower information)
                FlowerInfo(flower: flower)
            }
            .ignoresSafeArea(edges: .top) // Ignore the top safe area to extend the image to the top edge
        }
    }
}

// FlowerInfo: A simple view to display information about the flower
struct FlowerInfo: View {
    let flower: Flower
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("About \(flower.name)")
                .font(.title)
                .fontWeight(.bold)
            Text("This is a placeholder for detailed information about \(flower.name). You can add facts, care tips, or other details here.")
                .font(.body)
            Spacer()
        }
        .padding()
    }
}

// Custom View Modifier to create a stretchy header effect
struct StretchyModifier: ViewModifier {
    func body(content: Content) -> some View {
        // Use GeometryReader to access the size and position of the view
        GeometryReader { geometry in
            let currentHeight = geometry.size.height // Current height of the content
            // Calculate the scroll offset (minY of the frame in the ScrollView's coordinate space)
            let scrollOffset = geometry.frame(in: .named("scrollView")).minY
            // Ensure the offset is positive (we only care about upward scrolling)
            let positiveOffset = max(0, scrollOffset)
            
            // Calculate the new height and scale factor for the stretch effect
            let newHeight = currentHeight + positiveOffset
            let scaleFactor = newHeight / currentHeight
            
            // Apply the scale effect, scaling both x and y by the same factor, anchored at the bottom
            content
                .scaleEffect(x: scaleFactor, y: scaleFactor, anchor: .bottom)
        }
    }
}

// Extension to add the stretchy() modifier to any View
extension View {
    func stretchy() -> some View {
        modifier(StretchyModifier())
    }
}

// Preview provider for SwiftUI Canvas
struct FlowerView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample flower for preview
        FlowerView(flower: Flower(name: "rose"))
            .coordinateSpace(name: "scrollView") // Name the coordinate space for GeometryReader
    }
}
