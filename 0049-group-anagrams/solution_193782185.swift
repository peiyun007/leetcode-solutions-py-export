class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [String: [String]] = [:]
        for str in strs {
            let strSorted = String(str.sorted())
            var strArr = [String]()
            if let list = dict[strSorted] {
                strArr = list
            }
            strArr.append(str)
            dict[strSorted] = strArr
        }
        return Array(dict.values)
    }
}