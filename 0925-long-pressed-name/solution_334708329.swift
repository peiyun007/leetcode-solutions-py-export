private extension String {
    subscript(index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

class Solution {
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        var j = 0
        var bChars = Array(typed)
        for ch in name {
            if j == bChars.count {
                return false
            }
            if bChars[j] != ch {
                if j == 0 || bChars[j] != bChars[j - 1] {
                    return false
                }
                let char = bChars[j]
                while j < bChars.count && bChars[j] == char {
                    j += 1
                }
                if j >= bChars.count || bChars[j] != ch {
                    return false
                }
            }
            j += 1
        }
        for i in j..<bChars.count {
            if bChars[i] != bChars[i-1] {
                return false
            }
        }
        return true
    }
}