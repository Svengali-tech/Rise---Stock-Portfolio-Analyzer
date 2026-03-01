import SwiftUI

struct PortfolioOverviewView: View {
    let viewModel: PortfolioViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    PortfolioValueCard(summary: viewModel.portfolioSummary)
                    
                    PerformanceMetricsView(viewModel: viewModel)
                    
                    PortfolioChartView(stocks: viewModel.stocks)
                }
                .padding()
            }
            .navigationTitle("Portfolio Overview")
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    PortfolioOverviewView(viewModel: PortfolioViewModel())
}
