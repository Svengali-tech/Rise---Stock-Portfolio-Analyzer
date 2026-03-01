import SwiftUI

struct StockRowView: View {
    let stock: Stock
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(stock.symbol)
                    .font(.headline)
                Text(stock.companyName)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text("\(stock.shares.formatted()) shares")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(stock.currentValue.formatted(.currency(code: "USD")))
                    .font(.headline)
                
                HStack(spacing: 4) {
                    Image(systemName: stock.totalGainLoss >= 0 ? "arrow.up.right" : "arrow.down.right")
                        .font(.caption2)
                    Text(stock.percentageChange.formatted(.number.precision(.fractionLength(2))) + "%")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .foregroundStyle(stock.totalGainLoss >= 0 ? .green : .red)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    List {
        StockRowView(
            stock: Stock(
                symbol: "AAPL",
                companyName: "Apple Inc.",
                shares: 10,
                purchasePrice: 150.00,
                currentPrice: 178.50
            )
        )
    }
}
