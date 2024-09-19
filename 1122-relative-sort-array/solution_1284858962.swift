class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        let maxVal = arr1.max() ?? 0
        var cnt = Array(repeating: 0, count: maxVal + 1)
        for x in arr1 {
            cnt[x] += 1
        }
        var res = [Int]()
        for x in arr2 {
            for i in 0..<cnt[x] {
                res.append(x)
            }
            cnt[x] = 0
        }
        for x in 0...maxVal {
            for i in 0..<cnt[x] {
                res.append(x)
            }
        }
        return res
    }
}