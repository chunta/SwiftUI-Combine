import SwiftUI

struct ContentView: View {
    var bundleVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown Version"
    }

    var bundleBuild: String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown Build"
    }

    var body: some View {
        VStack {
            Text("1")
            Text("111")
            Text("1111")
            Text("Bundle Version: \(bundleVersion).\(bundleBuild)")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
