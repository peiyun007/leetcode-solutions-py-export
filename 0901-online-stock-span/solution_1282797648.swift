
class StockSpanner {
    var nums = [Int]()
    var stack = [(Int, Int)]()
    var i = -1
    init() {
        stack.append((-1, Int.max))
    }
    
    func next(_ price: Int) -> Int {
        i += 1
        while !stack.isEmpty && price >= stack[stack.count-1].1 {
            stack.removeLast()
        }
        stack.append((i, price))
        return i - stack[stack.count-2].0
    }
}

/**
 * Your StockSpanner object will be instantiated and called as such:
 * let obj = StockSpanner()
 * let ret_1: Int = obj.next(price)
 */