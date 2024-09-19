extension String {
    subscript(_ idx: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: idx)]
    }
}

class Solution {
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        var i = 0, j = 0, p = 0, q = 0
        let m = word1.count
        let n = word2.count
        while i < m && j < n {
            if word1[i][p] != word2[j][q] {
                return false
            }
            p += 1
            q += 1
            if p == word1[i].count {
                i += 1
                p = 0
            }
            if q == word2[j].count {
                j += 1
                q = 0
            }
        }
        return i == m && j == n
    }
}