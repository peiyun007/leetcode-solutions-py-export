private let mapping: [String] = [
    "0",
    "1",
    "abc",
    "def",
    "ghi",
    "jkl",
    "mno",
    "pqrs",
    "tuv",
    "wxyz"
]
class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else {
            return []
        }
        var ans = [String]()
        ans.append("")
        var digitChars = [Character](digits)
        for i in 0 ..< digitChars.count {
            let x = Int(String(digitChars[i]))!
            while ans.first?.count == i {
                let tmp = ans.removeFirst()
                for c in [Character](mapping[x]) {
                    ans.append("\(tmp)\(c)")
                }
            }
        }
        return ans;
    }
}