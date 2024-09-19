class Solution {
    func findOcurrences(_ text: String, _ first: String, _ second: String) -> [String] {
        let strArr = text.split(separator: " ").map{String($0)}
        var res = [String]()
        for (i, str) in strArr.enumerated() {
            if i >= strArr.count - 2 {
                break
            }
            if str == first && strArr[i + 1] == second {
                res.append(strArr[i + 2])
            }
        }
        return res
    }
}