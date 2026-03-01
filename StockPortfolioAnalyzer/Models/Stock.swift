import Foundation

struct Stock: Identifiable, Codable {
    let id: UUID
    let symbol: String
    let companyName: String
    let shares: Double
    let purchasePrice: Double
    let currentPrice: Double
    let purchaseDate: Date
    
    init(
        id: UUID = UUID(),
        symbol: String,
        companyName: String,
        shares: Double,
        purchasePrice: Double,
        currentPrice: Double,
        purchaseDate: Date = Date()
    )
    {
        self.id = id
        self.symbol = symbol
        self.companyName = companyName
        self.shares = shares
        self.purchasePrice = purchasePrice
        self.currentPrice = currentPrice
        self.purchaseDate = purchaseDate
    }
    var totalInvestment: Double {
        shares * purchasePrice
    }
    
    var currentValue: Double {
        shares * currentPrice
    }
    
    var totalGainLoss: Double {
        currentValue - totalInvestment
    }
    
    var percentageChange: Double {
        ((currentPrice - purchasePrice) / purchasePrice) * 100
    }
}
