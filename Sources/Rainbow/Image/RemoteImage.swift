import SwiftUI

public struct RemoteImage: View {
    
    var url: URL
    
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
