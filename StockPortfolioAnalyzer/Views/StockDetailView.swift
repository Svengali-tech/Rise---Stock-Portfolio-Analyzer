import SwiftUI

struct StockDetailView: View {
    let stock: Stock
    
    var body: some View {
        List {
            Section("Stock Information") {
                HStack {
                    Text("Symbol")
                    Spacer()
                    Text(stock.symbol)
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Text("Company")
                    Spacer()
                    Text(stock.companyName)
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Text("Shares")
                    Spacer()
                    Text(String(format: "%.2f", stock.shares))
                        .foregroundStyle(.secondary)
                }
            }
            
            Section("Price Information") {
                HStack {
                    Text("Purchase Price")
                    Spacer()
                    Text(String(format: "$%.2f", stock.purchasePrice))
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Text("Current Price")
                    Spacer()
                    Text(String(format: "$%.2f", stock.currentPrice))
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Text("Change")
                    Spacer()
                    Text(String(format: "%.2f%%", stock.percentageChange))
                        .foregroundStyle(stock.percentageChange >= 0 ? .green : .red)
                }
            }
            
            Section("Investment Summary") {
                HStack {
                    Text("Total Investment")
                    Spacer()
                    Text(String(format: "$%.2f", stock.totalInvestment))
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Text("Current Value")
                    Spacer()
                    Text(String(format: "$%.2f", stock.currentValue))
                        .foregroundStyle(.secondary)
                }
                
                HStack {
                    Text("Gain/Loss")
                    Spacer()
                    Text(String(format: "$%.2f", stock.totalGainLoss))
                        .foregroundStyle(stock.totalGainLoss >= 0 ? .green : .red)
                }
            }
            
            Section("Purchase Date") {
                HStack {
                    Text("Date")
                    Spacer()
                    Text(stock.purchaseDate, style: .date)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .navigationTitle(stock.symbol)
        .navigationBarTitleDisplayMode(.large)
    }
}

struct DetailRow: View {
    let label: String
    let value: String
    var isHighlighted: Bool = false
    
    var body: some View {
        HStack {
            Text(label)
                .font(isHighlighted ? .headline : .body)
                .foregroundStyle(isHighlighted ? .primary : .secondary)
            Spacer()
            Text(value)
                .font(isHighlighted ? .headline : .body)
                .fontWeight(isHighlighted ? .semibold : .regular)
        }
    }
}

#Preview {
    NavigationStack {
        StockDetailView(stock: Stock(
            symbol: "AAPL",
            companyName: "Apple Inc.",
            shares: 100,
            purchasePrice: 150.00,
            currentPrice: 178.50
        ))
    }
}
