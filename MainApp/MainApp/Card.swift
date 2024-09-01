import Foundation
import SwiftUI

struct Card: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Image("Condos")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 4))

            Text("Condo with awesome views of downtown")
                .font(.headline)

            Text("$42 avg/night")
                .font(.body)
                .lineLimit(1)
        })
    }
}
