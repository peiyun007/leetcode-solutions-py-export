class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        let sArr = Array(columnTitle)
        let n = sArr.count
        var ans = 0
        var factor = 1
        for i in (0..<n).reversed() {
            let x = getInt(sArr[i])
            ans += x*factor
            factor *= 26
        }
        return ans
    }

    func getInt(_ c: Character) -> Int {
        return Int(c.asciiValue ?? 0) - Int(Character("A").asciiValue ?? 0) + 1
    }
}