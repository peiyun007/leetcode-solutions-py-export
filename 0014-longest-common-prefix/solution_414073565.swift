private extension String {
    subscript(indexIndex: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: indexIndex)]
    }
    
    subscript(range: Range<Int>) -> String {
        let lowerBoundIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let upperBoundIndex = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[lowerBoundIndex..<upperBoundIndex])
    }
}

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else {
            return ""
        }
        let firstStr = strs[0]
        for (i, char) in firstStr.enumerated() {
            for j in 1..<strs.count {
                let innerChars = [Character](strs[j])
                if i == innerChars.count || innerChars[i] != char {
                    return strs[0][0..<i]
                }
            }
        }
        return firstStr
    }
}