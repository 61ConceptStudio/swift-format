//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2018 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import SwiftSyntax

/// A Pipeline maintains a registry of lint or formatting passes to apply to nodes in a Syntax tree.
public protocol Pipeline {
  /// Adds a file-based rule to be run before format rules.
  ///
  /// - Parameter fileRule: The file-based lint rule metatype that will be run before any other
  ///                       formatting/lint rules.
  func addFileRule(_ fileRule: FileRule.Type)

  /// Adds a given formatter to the registry of passes to run over nodes of the provided types.
  ///
  /// - Parameters
  ///   - formatType: The metatype of the formatter to be added, e.g. `ColonWhitespace.self`
  ///   - syntaxTypes: The list of syntax metatypes to apply format operations to.
  func addFormatter(_ formatRule: SyntaxFormatRule.Type, for syntaxTypes: Syntax.Type...)

  /// Adds a given linter to the registry of passes, to be run over Syntax nodes of the provided
  /// types.
  ///
  /// - Parameters
  ///   - lintType: The metatype of the linter to be added, e.g. `AlwaysUseLowerCamelCase.self`
  ///   - syntaxTypes: The list of syntax metatypes to apply format operations to.
  func addLinter(_ lintRule: SyntaxLintRule.Type, for syntaxTypes: Syntax.Type...)
}
