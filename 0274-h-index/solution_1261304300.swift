class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let n = citations.count
        var cnt = Array(repeating: 0, count: n+1)
        for x in citations {
            cnt[min(x, n)] += 1
        }
        var total = 0
        for i in (1...n).reversed() {
            total += cnt[i]
            if total >= i {
                return i
            }
        }
        return 0
    }
}