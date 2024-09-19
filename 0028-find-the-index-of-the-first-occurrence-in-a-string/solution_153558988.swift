private extension String {
    subscript (index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let haArray = Array(haystack)
        let neArray = Array(needle)
        let len1 = haArray.count
        let len2 = neArray.count
        if len1 < len2 {
            return -1
        }
        if len2 == 0 {
            return 0
        }
        for i in 0...len1-len2 {
            for j in 0..<len2 {
                if haArray[i+j] != neArray[j] {
                    break
                } else if (j == len2 - 1) {
                    return i
                }
            }
        }
        return -1
    }
}