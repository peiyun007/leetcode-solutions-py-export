class Solution {
    func commonChars(_ A: [String]) -> [String] {
        guard A.count > 0 else {return []}
        var counterMap = getCounterMap(A[0])
        for i in 1..<A.count {
            var counterMap1 = getCounterMap(A[i])
            for (ch, count) in counterMap {
                counterMap[ch] = min(counterMap[ch] ?? 0, counterMap1[ch] ?? 0)
            }
        }
        var res = [String]()
        for (ch, count) in counterMap {
            if count > 0 {
                res.append(contentsOf:Array(repeating: String(ch), count: count))
            }
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