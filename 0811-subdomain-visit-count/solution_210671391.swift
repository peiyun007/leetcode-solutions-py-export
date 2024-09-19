private extension String {
    subscript(index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

class Solution {
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        var dict: [String: Int] = [:]
        for str in cpdomains {
            let comps = str.split(separator: Character(" "))
            guard comps.count == 2, let count = Int(String(comps[0])) else {continue}
            let domain = String(comps[1])
            for i in 0..<domain.count {
                if domain[i] == "." {
                    let subDomain = String(domain.suffix(from: domain.index(domain.startIndex, offsetBy: i + 1)))
                    dict[subDomain] = (dict[subDomain] ?? 0) + count
                }
            }
            dict[domain] = (dict[domain] ?? 0) + count
        }
        return dict.reduce(into: [String]()) {$0.append("\($1.value) \($1.key)")}
    }
}