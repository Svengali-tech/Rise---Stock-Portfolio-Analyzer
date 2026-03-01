import Foundation

struct PortfolioSummary {
    let totalInvestment: Double
    let currentValue: Double
    let totalGainLoss: Double
    let percentageChange: Double
    let numberOfHoldings: Int
    
    var isProfit: Bool {
        totalGainLoss >= 0
    }
    
    static var empty: PortfolioSummary {
        PortfolioSummary(
            totalInvestment: 0,
            currentValue: 0,
            totalGainLoss: 0,
            percentageChange: 0,
            numberOfHoldings: 0
        )
    }
}
