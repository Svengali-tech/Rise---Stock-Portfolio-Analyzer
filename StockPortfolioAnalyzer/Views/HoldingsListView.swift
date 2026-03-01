import SwiftUI

struct HoldingsListView: View {
    let viewModel: PortfolioViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.stocks) { stock in
                    NavigationLink(destination: StockDetailView(stock: stock)) {
                        StockRowView(stock: stock)
                    }
                }
                .onDelete(perform: viewModel.deleteStock)
                .navigationTitle("Holdings")
                .overlay {
                    if viewModel.stocks.isEmpty {
                        ContentUnavailableView(
                            "No Holdings Yet",
                            systemImage: "chart.line.uptrend.xyaxis",
                            description: Text("Add stocks to start tracking your portfolio")
                        )
                    }
                }
            }
        }
    }
    
struct HoldingsListView_Previews: PreviewProvider {
    static var previews: some View {
        HoldingsListView(viewModel: PortfolioViewModel())
    }
}
}
