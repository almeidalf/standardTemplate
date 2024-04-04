//
//  PagingView.swift
//  Copyright © 2024 Skeelo.
//

import SwiftUI

public struct PagingView<Content: View, Item: Hashable>: View {
  // MARK: - Variables

  private let items: [Item]
  private let margins: CGFloat
  private let spacing: CGFloat
  private let height: CGFloat
  @State private var index: Int?
  private let content: (Item) -> Content

  // MARK: - Constructor

  public init(
    items: [Item],
    margins: CGFloat = 16,
    spacing: CGFloat = 8,
    height: CGFloat,
    index: State<Int?> = State(initialValue: nil),
    content: @escaping (Item) -> Content
  ) {
    self.items = items
    self.height = height
    self.margins = margins
    self.spacing = spacing
    self.content = content
    _index = index
  }

  // MARK: - Body

  public var body: some View {
    if #available(iOS 17.0, *) {
      if UIDevice.current.userInterfaceIdiom != .phone {
        ScrollView(.horizontal, showsIndicators: false) {
          LazyHStack(spacing: spacing) {
            ForEach(items, id: \.self) { item in
              content(item)
            }
          }
        }
        .contentMargins(16, for: .scrollIndicators)
        .safeAreaPadding(.horizontal, margins)
        .scrollClipDisabled()
      } else {
        ScrollView(.horizontal, showsIndicators: false) {
          LazyHStack(spacing: spacing) {
            ForEach(items, id: \.hashValue) { item in
              content(item)
                .containerRelativeFrame(.horizontal, count: 1, span: 1, spacing: 0)
                .id(item.hashValue)
            }
          }
          .scrollTargetLayout()
        }
        .contentMargins(16, for: .scrollIndicators)
        .safeAreaPadding(.horizontal, margins)
        .scrollTargetBehavior(.viewAligned)
        .scrollPosition(id: $index)
        .scrollClipDisabled()
      }
    } else {
      if UIDevice.current.userInterfaceIdiom != .phone {
        ScrollView(.horizontal, showsIndicators: false) {
          LazyHStack(spacing: spacing) {
            ForEach(items, id: \.self) { item in
              content(item)
            }
          }
          .padding(.vertical, 4)
          .padding(.horizontal, margins)
        }
        .frame(height: height + 8)
      } else {
        CustomPagingView(items: items, index: _index, margins: margins, spacing: spacing) { item in
          content(item)
        }
        .frame(height: height)
      }
    }
  }
}
