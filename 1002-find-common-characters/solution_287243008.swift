class Solution {
    func commonChars(_ A: [String]) -> [String] {
        guard A.count > 0 else {return []}
        var counterMap = getCounterMap(A[0])
        for i in 1..<A.count {
            var counterMap1 = getCounterMap(A[i])
            var delKeys = [Character]()
            for (ch, count) in counterMap {
                counterMap[ch] = min(counterMap[ch] ?? 0, counterMap1[ch] ?? 0)
                if let count = counterMap[ch], count == 0 {
                    delKeys.append(ch)
                }
            }
            for ch in delKeys {
                counterMap.removeValue(forKey: ch)
            }
        }
        var res = [String]()
        for (ch, count) in counterMap {
            res.append(contentsOf: Array(repeating:String(ch), count: count))
            // res.append(String(ch))
        }
        return res
    }
    
    private func getCounterMap(_ str: String) -> [Character: Int] {
        var counterMap = [Character: Int]()
        for ch in str {
            counterMap[ch] = (counterMap[ch] ?? 0) + 1
        }
        return counterMap
    }
}