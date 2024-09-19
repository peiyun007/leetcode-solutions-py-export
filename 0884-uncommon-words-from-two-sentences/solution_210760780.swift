class Solution {
    func uncommonFromSentences(_ A: String, _ B: String) -> [String] {
        var result = [String]()
        var map = [String: Int]()
        var dest = A + " " + B
        var strArr = dest.split(separator: " ")
        for substr in strArr {
            let str = String(substr)
            if let count = map[str] {
                map[str] = count + 1
            } else {
                map[str] = 1
            }
        }
        return Array(map.filter {$0.value == 1}.keys)
    }
}