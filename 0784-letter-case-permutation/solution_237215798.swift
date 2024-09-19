private extension Character {
    func letterCase() -> Int {
        switch(self) {
        case "a"..."z": return -1
        case "A"..."Z": return 1
        default: return 0
        }
    }
}

class Solution {
    func letterCasePermutation(_ S: String) -> [String] {
        if S.count == 0 {
            return [S]
        }
        let charArr = Array(S)
        var res = [String]()
        var temp = ""
        helper(&res, &temp, charArr, 0)
        return res
    }
    
    private func helper(_ res: inout [String], _ temp: inout String,  _ chars: [Character], _ pos: Int) {
        if temp.count == chars.count {
            res.append(String(temp))
            return
        }
        for i in pos...pos {
            temp.append(String(chars[i]))
            helper(&res, &temp, chars, i + 1)
            if chars[i].letterCase() != 0 {
                temp.removeLast()
                temp.append(chars[i].letterCase() > 0 ? String(chars[i]).lowercased() : String(chars[i]).uppercased())
                helper(&res, &temp, chars, i + 1)
            }
            temp.removeLast()
        }
    }
}