class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        var ans = [String]()
        let sArr = Array(s)
        var map = [String: Int]()
        for i in 0..<sArr.count where i+10 <= sArr.count {
            let str = String(sArr[i..<i+10])
            let cnt = map[str, default: 0]
            if cnt == 1 {
                ans.append(str)
            }
            map[str] = cnt + 1
        }
        return ans
    }
}