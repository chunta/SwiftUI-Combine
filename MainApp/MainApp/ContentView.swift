import SwiftUI

struct ContentView: View {
    var bundleVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown Version"
    }

    var bundleBuild: String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown Build"
    }

    var appVersion: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
           let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
        {
            return "Version: \(version) (Build: \(build))"
        }
        return "Version info not available"
    }

    var body: some View {
        VStack {
            Text(appVersion)
            #if DEV
                Text("DEBUG Mode - Bundle Version: \(bundleVersion).\(bundleBuild)")
                    .padding()
            #elseif UAT
                Text("UAT Mode - Bundle Version: \(bundleVersion).\(bundleBuild)")
                    .padding()
            #else
                Text("PRO Mode - Bundle Version: \(bundleVersion).\(bundleBuild)")
                    .padding()
            #endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
