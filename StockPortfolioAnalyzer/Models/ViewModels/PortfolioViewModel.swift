import SwiftUI
import Foundation
import Observation

@Observable
class PortfolioViewModel {
    var stocks: [Stock] = []
    
    init() {
        loadMockData()
    }
    
    var portfolioSummary: PortfolioSummary {
        let totalInvestment = stocks.reduce(0) { $0 + $1.totalInvestment }
        let currentValue = stocks.reduce(0) { $0 + $1.currentValue }
        let totalGainLoss = currentValue - totalInvestment
        let percentageChange = totalInvestment > 0 ? (totalGainLoss / totalInvestment) * 100 : 0
        
        return PortfolioSummary(
            totalInvestment: totalInvestment,
            currentValue: currentValue,
            totalGainLoss: totalGainLoss,
            percentageChange: percentageChange,
            numberOfHoldings: stocks.count
        )
    }
    
    func addStock(_ stock: Stock) {
        stocks.append(stock)
    }
    
    func deleteStock(at indexSet: IndexSet) {
        stocks.remove(atOffsets: indexSet)
    }
    
    func topPerformer() -> Stock? {
        stocks.max(by: { $0.percentageChange < $1.percentageChange })
    }
    
    func worstPerformer() -> Stock? {
        stocks.min(by: { $0.percentageChange < $1.percentageChange })
    }
    
    private func loadMockData() {
            stocks = [
                Stock(
                    symbol: "AAPL",
                    companyName: "Apple Inc.",
                    shares: 10,
                    purchasePrice: 150.00,
                    currentPrice: 178.50
                ),
                Stock(
                    symbol: "MSFT",
                    companyName: "Microsoft Corporation",
                    shares: 5,
                    purchasePrice: 320.00,
                    currentPrice: 385.20
                ),
                Stock(
                    symbol: "GOOGL",
                    companyName: "Alphabet Inc.",
                    shares: 8,
                    purchasePrice: 125.00,
                    currentPrice: 141.80
                ),
                Stock(
                    symbol: "TSLA",
                    companyName: "Tesla Inc.",
                    shares: 3,
                    purchasePrice: 245.00,
                    currentPrice: 198.50
                ),
                Stock(
                    symbol: "AMZN",
                    companyName: "Amazon.com Inc.",
                    shares: 6,
                    purchasePrice: 135.00,
                    currentPrice: 152.30
                )
            ]
        }
    }
