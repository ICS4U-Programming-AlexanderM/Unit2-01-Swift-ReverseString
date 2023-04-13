import Foundation
//  Created by Alexander Matheson
//  Created on 2023-Apr-13
//  Version 1.0
//  Copyright (c) 2023 Alexander Matheson. All rights reserved.
//
//  This program reverses the lines in a file.

// This function finds the max run for each line.
func reverse(line: String) -> String {
  if line.count == 0 {
    return line
  } else {
    return reverse(line: String(line.dropFirst())) + String(line.first!)
  }
}

// Read in lines from input.txt.
let inputFile = URL(fileURLWithPath: "input.txt")
let inputData = try String(contentsOf: inputFile)
let lineArray = inputData.components(separatedBy: .newlines)

// Open the output file for writing.
let outputFile = URL(fileURLWithPath: "output.txt")

// Call function to find run and print to output file.
var reversedString = ""
for position in lineArray {
  let reversed = reverse(line: position)
  print(reversed)

  // Write results to output 
  reversedString = reversedString + "\(reversed)\n"
  try reversedString.write(to: outputFile, atomically: true, encoding: .utf8)
}
