class Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        if nums.count == 0 {
            return []
        }
        var a = nums.sorted {$0 < $1}
        var LDS = Array(repeating: 1, count: a.count)
        var parent = Array(repeating: -1, count: a.count)
        var index = 0
        var maxLDS = 0
        for i in 0..<a.count {
            for j in 0..<i {
                if a[i] % a[j] == 0 && LDS[i] < 1 + LDS[j] {
                    LDS[i] = 1 + LDS[j]
                    parent[i] = j
                    if LDS[i] > maxLDS {
                        maxLDS = LDS[i]
                        index = i
                    }
                }
            }
        }
        var result: [Int] = []
        while index >= 0 {
            result.insert(a[index], at: 0)
            index = parent[index]
        }
        return result
    }
}
