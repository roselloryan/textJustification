import Foundation

public func textJustification(words: [String], L: Int) -> [String] {
    var sol = [String]()
    var lines = [[String]]()
    var temp = [String]()
    
    for i in 0..<words.count {
        let tempCount = temp.reduce(0) { $0 + $1.characters.count }
        
        if words[i].characters.count + tempCount + temp.count <= L {
            temp += [words[i]]
        }
        else {
            lines += [temp]
            temp = [words[i]]
        }
    }
    lines += [temp]
    print("lines: \(lines)")
    
    for j in 0..<lines.count {
        let charCount = lines[j].reduce(0) { $0 + $1.characters.count }
        print("charCount: \(charCount) for lines[j]: \(lines[j]) ")
        
        if lines[j].count == 1 || j == lines.count - 1 {
            // Left justify
            let newLine = lines[j].joined(separator: " ")  + String(repeating: " ", count: L - charCount - (lines[j].count - 1))
            sol += [newLine]
        }
        else {
            // Space that shit out
            let spaces = L - charCount
            var remainders = spaces % (lines[j].count - 1)
            print("spaces: \(spaces) and remainders: \(remainders)")
            var newLine = ""
            
            for k in 0..<lines[j].count {
                if remainders > 0 {
                    newLine += lines[j][k] + String(repeating: " ", count: spaces / (lines[j].count - 1) + 1)
                    remainders -= 1
                }
                else if k == lines[j].count - 1 {
                    newLine += lines[j][k]
                }
                else {
                    newLine += lines[j][k] + String(repeating: " ", count: spaces / (lines[j].count - 1))
                }
            }
            sol += [newLine]
        }
    }
    print("sol: \(sol)")
    
    return sol
}
