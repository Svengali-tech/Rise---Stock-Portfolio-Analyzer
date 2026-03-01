import SwiftUI

struct ContentView: View {
    @State private var portfolioViewModel = PortfolioViewModel()
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            PortfolioOverviewView(viewModel: portfolioViewModel)
                .tabItem {
                    Label("Portfolio", systemImage: "chart.pie.fill")
                }
                .tag(0)
            
            HoldingsListView(viewModel: portfolioViewModel)
                .tabItem {
                    Label("Holdings", systemImage: "list.bullet")
                }
                .tag(1)
            
            AddStockView(viewModel: portfolioViewModel)
                .tabItem {
                    Label("Add Stock", systemImage: "plus.circle.fill")
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
