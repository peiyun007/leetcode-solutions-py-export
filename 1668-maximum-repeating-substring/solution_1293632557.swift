class Solution {
    func maxRepeating(_ sequence: String, _ word: String) -> Int {
        let sArr = Array(sequence)
        let wArr = Array(word)
        let m = sArr.count, n = wArr.count
        if m < n {
            return 0
        }
        var f = Array(repeating: 0, count: m)
        for i in n-1..<m {
            var valid = true
            for j in 0..<n {
                if sArr[i-n+1+j] != wArr[j] {
                    valid = false
                    break
                }
            }
            if valid {
                if i == n-1 {
                    f[i] = 1
                } else {
                    f[i] = f[i-n] + 1
                }
            }
        }
        return f.max() ?? 0
    }
}