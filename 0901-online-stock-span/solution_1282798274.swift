
class StockSpanner {
    var nums = [Int]()
    var stack = [Int]()
    var i = -1
    init() {
        
    }
    
    func next(_ price: Int) -> Int {
        i += 1
        nums.append(price)
        while !stack.isEmpty && price >= nums[stack[stack.count-1]] {
            stack.removeLast()
        }
        stack.append(i)
        return stack.count == 1 ? i+1 : i - stack[stack.count-2]
    }
}

/**
 * Your StockSpanner object will be instantiated and called as such:
 * let obj = StockSpanner()
 * let ret_1: Int = obj.next(price)
 */