class Solution {
    func defangIPaddr(_ address: String) -> String {
        var tArr = [Character]()
        for ch in address {
            if ch == "." {
                tArr.append("[")
                tArr.append(".")
                tArr.append("]")
            } else {
                tArr.append(ch)
            }
        }
        return String(tArr)
    }
}