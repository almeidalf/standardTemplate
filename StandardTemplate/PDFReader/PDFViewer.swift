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
    let document = Document(url: Bundle.main.url(forResource: pdfName.replacingOccurrences(of: ".pdf", with: ""), withExtension: "pdf")!)
    VStack(alignment: .trailing) {
    PDFView(document: document)
      .scrollDirection(.horizontal)
      .useParentNavigationBar(true)
      .spreadFitting(.adaptive)
      .scrubberBarType(.horizontal)
      .updateControllerConfiguration { controller in
        controller.title = ""
        controller.navigationItem.setRightBarButtonItems(
          [controller.documentEditorButtonItem, controller.settingsButtonItem, controller.readerViewButtonItem],
          for: .document, animated: false)
        
        controller.navigationItem.setLeftBarButtonItems(
          [controller.annotationButtonItem, controller.searchButtonItem, controller.outlineButtonItem],
          for: .document, animated: false)
      }
      .allowedMenuActions(.all)
    }
  }
}
