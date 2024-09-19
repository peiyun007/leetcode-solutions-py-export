class Solution {
    func maxProduct(_ words: [String]) -> Int {
        let n = words.count
        var mp = [Int: Int]()
        for (i, w) in words.enumerated() {
            let arr = Array(w)
            var mask = 0
            for (j, ch) in arr.enumerated() {
                mask |= 1 << getInt(ch)
            }
            let len = mp[mask, default: 0]
            if arr.count > len {
                mp[mask] = arr.count
            }
        }
        var maxProduct = 0
        for (key1, value1) in mp {
            for (key2, value2) in mp {
                if key1 & key2 == 0 {
                    maxProduct = max(maxProduct, value1 * value2)
                }
            }
        }
        return maxProduct
    }

    func getInt(_ ch: Character) -> Int {
        return Int(ch.asciiValue ?? 0) - Int(Character("a").asciiValue ?? 0)
    }
}