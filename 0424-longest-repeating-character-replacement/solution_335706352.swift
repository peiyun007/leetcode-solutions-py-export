private extension String {
    subscript(index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var lo = 0, res = 0
        var freq = [Character: Int]()
        
        for (hi, ch) in s.enumerated() {
            let currentFreq = (freq[ch] ?? 0) + 1
            freq[ch] = currentFreq
            let maxValue = getMax(freq)
            let currentWindow = hi - lo + 1
            if currentWindow - maxValue <= k {
                res = max(res, currentWindow)
            } else {
                let startCh = s[lo]
                lo += 1
                freq[startCh] = (freq[startCh] ?? 0) - 1
            }
        }
        return res
    }
    
    private func getMax(_ freq: [Character: Int]) -> Int {
        var ans = -1
        for (ch, num) in freq {
            ans = max(ans, num)
        }
        return ans
    }
    
    /*
    private func getMax(_ freq: [Int]) -> Int {
        var ans = 0
        for i in freq {
            if freq[i] > freq[ans] {
                ans = i
            }
        }
        return ans
    }
    */
}