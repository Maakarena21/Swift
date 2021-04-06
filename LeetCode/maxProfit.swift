func maxProfit(_ prices: [Int]) -> Int {
    var profit = 0
    var sum = 0
    for i in 0..<prices.count {
        for k in i+1..<prices.count {
            sum = prices[k] - prices[i]
            if sum > profit {
                profit = sum
            }
        }
    }
    return profit
}