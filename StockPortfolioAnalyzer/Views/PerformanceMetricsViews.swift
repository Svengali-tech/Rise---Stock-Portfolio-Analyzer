import SwiftUI

struct PerformanceMetricsView: View {
    let viewModel: PortfolioViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Performance")
                .font(.headline)
                .padding(.horizontal)
            
            VStack(spacing: 12) {
                if let topPerformer = viewModel.topPerformer() {
                    PerformanceRow(
                        title: "Top Performer",
                        stock: topPerformer,
                        isPositive: true
                    )
                }
                
                if let worstPerformer = viewModel.worstPerformer() {
                    PerformanceRow(
                        title: "Needs Attention",
                        stock: worstPerformer,
                        isPositive: false
                    )
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
        }
    }
}

struct PerformanceRow: View {
    let title: String
    let stock: Stock
    let isPositive: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(stock.symbol)
                    .font(.headline)
                Text(stock.companyName)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(stock.percentageChange.formatted(.number.precision(.fractionLength(2))) + "%")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(stock.percentageChange >= 0 ? .green : .red)
                Text(stock.totalGainLoss.formatted(.currency(code: "USD")))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    PerformanceMetricsView(viewModel: PortfolioViewModel())
        .padding()
        .background(Color(.systemGroupedBackground))
}
