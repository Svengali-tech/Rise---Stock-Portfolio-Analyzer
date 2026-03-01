import SwiftUI

struct AddStockView: View {
    let viewModel: PortfolioViewModel
    
    @State private var symbol = ""
    @State private var companyName = ""
    @State private var shares = ""
    @State private var purchasePrice = ""
    @State private var currentPrice = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Stock Information") {
                    TextField("Symbol (e.g., AAPL)", text: $symbol)
                        .textInputAutocapitalization(.characters)
                    TextField("Company Name", text: $companyName)
                }
                
                Section("Investment Details") {
                    TextField("Number of Shares", text: $shares)
                        .keyboardType(.decimalPad)
                    TextField("Purchase Price", text: $purchasePrice)
                        .keyboardType(.decimalPad)
                    TextField("Current Price", text: $currentPrice)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Button("Add to Portfolio") {
                        addStock()
                    }
                    .frame(maxWidth: .infinity)
                    .fontWeight(.semibold)
                }
            }
            .navigationTitle("Add Stock")
            .navigationBarTitleDisplayMode(.inline)
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK") {
                    clearForm()
                }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    private func clearForm() {
        symbol = ""
        companyName = ""
        shares = ""
        purchasePrice = ""
        currentPrice = ""
    }
    
    private func addStock() {
        guard !symbol.isEmpty,
              !companyName.isEmpty,
              let sharesValue = Double(shares),
              let purchasePriceValue = Double(purchasePrice),
              let currentPriceValue = Double(currentPrice),
              sharesValue > 0,
              purchasePriceValue > 0,
              currentPriceValue > 0 else {
            alertMessage = "Please fill in all fields with valid values"
            showingAlert = true
            return
        }
        
        let newStock = Stock(
            symbol: symbol.uppercased(),
            companyName: companyName,
            shares: sharesValue,
            purchasePrice: purchasePriceValue,
            currentPrice: currentPriceValue
        )
        
        viewModel.addStock(newStock)
        alertMessage = "\(symbol.uppercased()) added to your portfolio!"
        showingAlert = true
    }
}

#Preview {
    AddStockView(viewModel: PortfolioViewModel())
}
