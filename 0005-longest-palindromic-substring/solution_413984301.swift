class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.length > 1 else {
            return s
        }
        var maxStart = 0
        var maxLen = 1
        let sChars = Array(s)
        let len = sChars.count
        var isPalin = Array(repeating: Array(repeating: false, count: len), count: len)
        for i in 0..<len {
            isPalin[i][i] = true
        }
        for i in 0..<len-1 {
            if sChars[i] == sChars[i+1] {
                isPalin[i][i+1] = true
                maxStart = i
                maxLen = 2
            }
        }
        if len > 2 {
            for length in 3...len {
                for i in 0...len-length {
                    if sChars[i] == sChars[i+length-1] && isPalin[i+1][i+length-2] {
                        isPalin[i][i+length-1] = true
                        maxStart = i
                        maxLen = length
                    }
                }
            }
        }
        return String(sChars[maxStart...maxStart+maxLen-1])
    }
}