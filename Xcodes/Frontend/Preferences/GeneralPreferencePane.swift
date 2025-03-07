import AppleAPI
import SwiftUI

struct GeneralPreferencePane: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack(alignment: .leading) {
            GroupBox("AppleID") {
                if appState.authenticationState == .authenticated {
                    SignedInView()
                } else {
                    Button("SignIn", action: { self.appState.presentedSheet = .signIn })
                }
            }
            .groupBoxStyle(PreferencesGroupBoxStyle())
            Divider()
            
            GroupBox("Notifications") {
                NotificationsView().environmentObject(appState)
            }
            .groupBoxStyle(PreferencesGroupBoxStyle())
            Divider()
            
            GroupBox("Misc") {
                Toggle("TerminateAfterLastWindowClosed", isOn: $appState.terminateAfterLastWindowClosed)
            }
            .groupBoxStyle(PreferencesGroupBoxStyle())
        }
    }
}

struct GeneralPreferencePane_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GeneralPreferencePane()
                .environmentObject(AppState())
                .frame(maxWidth: 600)
        }
    }
}
