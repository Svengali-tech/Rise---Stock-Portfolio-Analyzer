import SwiftUI

struct PortfolioValueCard: View {
    let summary: PortfolioSummary
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Total Portfolio Value")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Text(summary.currentValue.formatted(.currency(code: "USD")))
                .font(.system(size: 40, weight: .bold, design: .rounded))
            
            HStack(spacing: 8) {
                Image(systemName: summary.isProfit ? "arrow.up.right" : "arrow.down.right")
                    .font(.subheadline)
                
                Text(summary.totalGainLoss.formatted(.currency(code: "USD")))
                    .font(.headline)
                
                Text("(\(summary.percentageChange.formatted(.number.precision(.fractionLength(2)))))%")
                    .font(.subheadline)
            }
            .foregroundStyle(summary.isProfit ? .green : .red)
            
            Divider()
                .padding(.vertical, 4)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Invested")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text(summary.totalInvestment.formatted(.currency(code: "USD")))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("Holdings")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text("\(summary.numberOfHoldings)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
    }
}

#Preview {
    PortfolioValueCard(
        summary: PortfolioSummary(
            totalInvestment: 10000,
            currentValue: 12500,
            totalGainLoss: 2500,
            percentageChange: 25,
            numberOfHoldings: 5
        )
    )
    .padding()
    .background(Color(.systemGroupedBackground))
}
