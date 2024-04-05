//
//  PDFView.swift
//  StandardTemplate
//
//  Created by Felipe Almeida on 04/04/24.
//

import SwiftUI
import PSPDFKit
import PSPDFKitUI

struct PDFViewer: View {
  @ObservedObject var viewModel = HomeViewModel()
  let pdfName: String
  
  var body: some View {
    PDFKitView(pdfName: pdfName)
  }
}

struct PDFKitView: UIViewControllerRepresentable {
  let pdfName: String
  
  func makeUIViewController(context: Context) -> PDFViewController {
    let document = Document(url: Bundle.main.url(forResource: pdfName.replacingOccurrences(of: ".pdf", with: ""), withExtension: "pdf")!)
    let pdfController = PDFViewController(document: document)
    let textParser = document.textParserForPage(at: 0)!
    let glyphs = textParser.glyphs
    let glyph = glyphs[26]
    return pdfController
  }
  
  func updateUIViewController(_ pdfController: PDFViewController, context: Context) {
    //
  }
}
