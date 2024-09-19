private extension String {
    subscript(intIndex: Int) -> Character {
        let index = self.characters.index(self.startIndex, offsetBy: intIndex)
        return self[index]
    }
    subscript(range: Range<Int>) -> String {
        let lowerBoundIndex = self.characters.index(self.startIndex, offsetBy: range.lowerBound)
        let upperBoundIndex = self.characters.index(self.startIndex, offsetBy: range.upperBound)
        let rangeInStringIndex = lowerBoundIndex ..< upperBoundIndex
        let stringSlice = self[rangeInStringIndex]
        return String(stringSlice)
    }
}

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else {
            return ""
        }
        let chars = [Character](strs[0])
        for i in 0 ..< chars.count {
            let char = chars[i]
            for j in 1 ..< strs.count {
                let innerchars = [Character](strs[j])
                if i == innerchars.count || innerchars[i] != char {
                    return strs[0][0..<i]
                }
            }
        }
        return strs[0]
    }
}