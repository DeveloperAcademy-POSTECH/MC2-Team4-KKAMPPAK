//
//  TimePicker.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by yusang on 2023/05/10.
//
import SwiftUI

struct MultiPicker<Tag: Hashable>: View  {
    let columns: [Column]
    var selections: [Binding<Tag>]
    
    init?(columns: [Column], selections: [Binding<Tag>]) {
        guard !columns.isEmpty && columns.count == selections.count else {
            return nil
        }
        
        self.columns = columns
        self.selections = selections
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ForEach(0 ..< columns.count) { index in
                    let column = columns[index]
                    ZStack(alignment: Alignment.init(horizontal: .customCenter, vertical: .center)) {
                        if (!column.label.isEmpty && !column.options.isEmpty) {
                            HStack {
                                Text(verbatim: column.options.last!.text)
                                    .foregroundColor(.clear)
                                    .alignmentGuide(.customCenter) { $0[HorizontalAlignment.center] }
                                Text(column.label).foregroundColor(Color.white)
                            }
                        }
                        Picker(column.label, selection: selections[index]) {
                            ForEach(column.options, id: \.tag) { option in
                                Text(verbatim: option.text).tag(option.tag).foregroundColor(Color.white)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: geometry.size.width / CGFloat(columns.count), height: geometry.size.height)
                        .clipped()
                    }
                    
                }
            }
        }
    }
}

extension MultiPicker {
    struct Column {
        struct Option {
            var text: String
            var tag: Tag
        }
        
        var label: String
        var options: [Option]
    }
}

private extension HorizontalAlignment {
    enum CustomCenter: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat { context[HorizontalAlignment.center] }
    }
    
    static let customCenter = Self(CustomCenter.self)
}



