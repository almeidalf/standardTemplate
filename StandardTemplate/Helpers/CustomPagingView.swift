//
//  PagingView.swift
//  Copyright © 2024 Skeelo.
//

import SwiftUI

public struct CustomPagingView<Content: View, Item: Hashable>: View {
  // MARK: - Variables

  private let items: [Item]
  private let margins: CGFloat
  private let spacing: CGFloat
  private let content: (Item) -> Content

  @State private var index: Int?
  @GestureState private var dragOffset: CGFloat = 0

  // MARK: - Constructor

  public init(
    items: [Item],
    index: State<Int?> = State(initialValue: 0),
    margins: CGFloat,
    spacing: CGFloat,
    content: @escaping (Item) -> Content
  ) {
    self.content = content
    self.items = items
    _index = index
    self.margins = margins
    self.spacing = spacing
  }

  // MARK: - Body

  public var body: some View {
    GeometryReader { proxy in
      let pageWidth = max(proxy.size.width - (spacing + margins), 0)
      let currentOffset = dragOffset - (CGFloat(index ?? 0) * pageWidth)

      HStack(spacing: 0) {
        ForEach(items, id: \.self) { item in
          content(item)
            .frame(width: pageWidth, alignment: .leading)
        }
      }
      .padding(.horizontal, margins)
      .offset(x: currentOffset)
      .gesture(
        DragGesture()
          .updating($dragOffset) { value, state, _ in
            if (index == 0 && value.translation.width > 0) || (index == items.count - 1 && value.translation.width < 0) {
              state = value.translation.width / 2
            } else {
              state = value.translation.width
            }
          }
          .onEnded { value in
            let dragThreshold = pageWidth / 20

            if value.translation.width > dragThreshold {
              index = (index ?? 0) - 1
            }

            if value.translation.width < -dragThreshold {
              index = (index ?? 0) + 1
            }

            index = max(min(index ?? 0, items.count - 1), 0)
          }
      )
    }
    .animation(.spring, value: dragOffset)
  }
}
