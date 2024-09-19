class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var dict = [Int: Int]()
        for i in arr {
            dict[i] = (dict[i] ?? 0) + 1
        }
        return dict.keys.count == Set(dict.values).count
    }
}