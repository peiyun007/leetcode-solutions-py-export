
class CombinationIterator {
    var list = [String]()
    var index = 0

    init(_ characters: String, _ combinationLength: Int) {
        let sArr = Array(characters)
        let n = sArr.count
        var temp = [Character]()
        dfs(0)
        func dfs(_ idx: Int) {
            if temp.count > combinationLength {
                return
            }
            if temp.count == combinationLength {
                list.append(String(temp))
            } else {
                for i in idx..<n {
                    temp.append(sArr[i])
                    dfs(i+1)
                    temp.removeLast()
                }
            }
        }
    }
    
    func next() -> String {
        defer { index += 1 }
        return list[index]
    }
    
    func hasNext() -> Bool {
        return index < list.count
    }
}

/**
 * Your CombinationIterator object will be instantiated and called as such:
 * let obj = CombinationIterator(characters, combinationLength)
 * let ret_1: String = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */