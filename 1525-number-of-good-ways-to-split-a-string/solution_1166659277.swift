class Solution {
    func numSplits(_ s: String) -> Int {
        let arr = Array(s)
        var word = Set<Character>()
        var begin = Array(repeating: 0, count: arr.count)
        for i in 0..<arr.count {
            word.insert(arr[i])
            begin[i] = word.count
        }
        word.removeAll()
        var res = 0
        for i in (1..<arr.count).reversed() {
            word.insert(arr[i])
            if begin[i-1] == word.count {
                res += 1
            }
        }
        return res
    }
}