class Solution {
    let mapping: [String] = [
        "0",
        "1",
        "abc",
        "def",
        "ghi",
        "jkl",
        "mno",
        "pqrs",
        "tuv",
        "wxyz",
    ]
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else {
            return []
        }
        var res = [String]()
        var temp = [Character]()
        dfs(Array(digits), 0, &res, &temp)
        return res
    }

    func dfs(_ digits: [Character], _ idx: Int, _ res: inout [String], _ temp: inout [Character]) {
        if idx == digits.count {
            res.append(String(temp))
            return
        }
        let i = Int(String(digits[idx])) ?? 0
        for c in Array(mapping[i]) {
            temp.append(c)
            dfs(digits, idx + 1, &res, &temp)
            temp.removeLast()
        }
    }
}