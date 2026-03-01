import SwiftUI
import Charts

struct PortfolioChartView: View {
    let stocks: [Stock]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Portfolio Allocation")
                .font(.headline)
                .padding(.horizontal)
            
            VStack {
                if stocks.isEmpty {
                    Text("No holdings to display")
                        .foregroundStyle(.secondary)
                        .frame(height: 200)
                } else {
                    Chart(stocks) { stock in
                        SectorMark(
                            angle: .value("Value", stock.currentValue),
                            innerRadius: .ratio(0.5),
                            angularInset: 2
                        )
                        .foregroundStyle(by: .value("Stock", stock.symbol))
                        .cornerRadius(4)
                    }
                    .frame(height: 250)
                    .padding()
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        ForEach(stocks) { stock in
                            HStack(spacing: 6) {
                                Circle()
                                    .fill(Color.accentColor)
                                    .frame(width: 10, height: 10)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(stock.symbol)
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                    Text(stock.currentValue.formatted(.currency(code: "USD")))
                                        .font(.caption2)
                                        .foregroundStyle(.secondary)
                                }
                                
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.05), radius: 8, y: 4)
        }
    }
    
    private func colorForStock(_ stock: Stock) -> Color {
        let colors: [Color] = [.blue, .green, .orange, .purple, .pink, .red, .yellow, .cyan]
        let index = stocks.firstIndex(where: { $0.id == stock.id }) ?? 0
        return colors[index % colors.count]
    }
}

#Preview {
    PortfolioChartView(stocks: PortfolioViewModel().stocks)
        .padding()
        .background(Color(.systemGroupedBackground))
}
