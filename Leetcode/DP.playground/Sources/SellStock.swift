import Foundation





///714. 买卖股票的最佳时机含手续费 714. Best Time to Buy and Sell Stock with Transaction Fee
// 使用 for index 的循环比  获取到value的稍微快点
class AASolution {
	func maxProfit(_ prices: [Int], _ fee: Int) -> Int {


		guard prices.count > 1 else {
			return 0
		}

		var buy = -prices[0]
		var sell = 0
		for i in 1..<prices.count {
			let lastBuy = buy
			buy = max(lastBuy, sell - prices[i])
			sell = max(sell, lastBuy + prices[i] - fee)

		}
		return sell


//		guard prices.count >= 2 else {
//			return 0
//		}
//
//		var buy = -prices[0]
//		var sell = 0
//
//		for price in prices {
//			buy = max(buy, sell - price)
//			sell = max(sell, buy + price - fee)
//		}
//		return sell
//

	}
}
