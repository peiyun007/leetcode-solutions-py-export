class Solution {
    var parents = [Int: Int]()
    func find(_ x: Int) -> Int {
        let px = parents[x] ?? x
        if px == x {
            return x
        }
        parents[x] = find(px)
        return parents[x] ?? x
    }
    
    func union(_ x: Int, _ y: Int) {
        var px = find(x)
        var py = find(y)
        if px < py {
            (px, py) = (py, px)
        }
        parents[px] = py
    }
    
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var emailToIndex = [String: Int]()
        var emailToName = [String: String]()
        var emailCount = 0
        for account in accounts {
            let name = account[0]
            for i in 1..<account.count {
                let email = account[i]
                emailToIndex[email] = emailCount
                emailToName[email] = name
                emailCount += 1
            }
        }
        for account in accounts {
            let name = account[0]
            let firstEmail = account[1]
            let firstIndex = emailToIndex[firstEmail] ?? 0
            for i in 2..<account.count {
                let nextEmail = account[i]
                let nextIndex = emailToIndex[nextEmail] ?? 0
                union(firstIndex, nextIndex)
            }
        } 
        var indexToEmails = [Int: [String]]()
        for (email, index) in emailToIndex {
            let pIndex = find(index)
            var emails = indexToEmails[pIndex] ?? [String]()
            emails.append(email)
            indexToEmails[pIndex] = emails
        }
        var merged = [[String]]()
        for (index, emails) in indexToEmails {
            var sortedEmails = emails.sorted(by: <)
            var account = [String]()
            account.append(emailToName[sortedEmails[0]] ?? "")
            account.append(contentsOf: sortedEmails)
            merged.append(account)
        }
        return merged
    }
}