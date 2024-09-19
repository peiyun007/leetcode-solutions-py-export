class Solution {
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        let strArr = products.sorted(by: <)
        var query = ""
        var beginIndex = 0
        var res = [[String]]()
        for ch in searchWord {
            query += String(ch)
            let findIndex = bsearch(strArr, query, beginIndex)
            var ans = [String]()
            for i in findIndex..<min(findIndex+3, strArr.count) {
                if strArr[i].hasPrefix(query) {
                    ans.append(strArr[i])
                }
            }
            res.append(ans)
            beginIndex = findIndex
        }
        return res
    }

    func bsearch(_ arr: [String], _ target: String, _ startIndex: Int) -> Int {
        var l = startIndex, r = arr.count
        while l < r {
            let mid = l + (r-l) / 2
            if arr[mid] < target {
                l = mid + 1
            } else if arr[mid] > target {
                r = mid
            } else {
                return mid
            }
        }
        return l
    }
}