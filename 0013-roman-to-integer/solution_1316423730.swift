class Solution {
    func romanToInt(_ s: String) -> Int {
        let symbolValues: [Character: Int] = [
            "I" : 1,
            "V" : 5,
            "X" : 10,
            "L" : 50,
            "C" : 100,
            "D" : 500,
            "M" : 1000,
        ]
        let sArr = Array(s)
        var ans = 0
        for i in 0..<sArr.count {
            let x = symbolValues[sArr[i], default: 0]
            if i < sArr.count-1 && x < symbolValues[sArr[i+1], default: 0] {
                ans -= x
            } else {
                ans += x
            }
        }
        return ans
    }
}