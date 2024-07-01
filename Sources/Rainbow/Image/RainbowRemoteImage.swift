import SwiftUI

struct RainbowRemoteImage: View {
    
    private var url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    public var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    Spacer()
                }
            case .success(let image):
                GeometryReader { reader in
                    image
                        .resizable()
                        .frame(maxWidth: reader.size.width)
                        .clipped()
                }
            case .failure:
                Image(systemName: "xmark.circle")
            @unknown default:
                ProgressView()
            }
        }
    }
}
