private extension String {
    subscript(idx: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: idx)]
    }
}

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else {
            return []
        }
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
        var res = [String]()
        var temp = ""
        dfs(&res, &temp, digits, 0, mapping)
        return res
    }

    private func dfs(_ res: inout [String], _ temp: inout String, _ digits: String, _ index: Int, _ mapping: [String]) {
        if index == digits.count {
            res.append(temp)
            return
        }
        let mappingStr = mapping[Int(String(digits[index])) ?? 0]
        for ch in mappingStr {
            temp.append(ch)
            dfs(&res, &temp, digits, index + 1, mapping)
            temp.removeLast()
        }
    }
}
