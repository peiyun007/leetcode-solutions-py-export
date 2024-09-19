class Solution {
    func finalValueAfterOperations(_ operations: [String]) -> Int {
        var ans = 0
        for op in operations {
            let arr = Array(op)
            if arr.count < 3 { continue }
            if arr[0] == "-" || arr[1] == "-" {
                ans -= 1
            } else if arr[0] == "+" || arr[1] == "+" {
                ans += 1
            }
        }
        return ans
    }
}