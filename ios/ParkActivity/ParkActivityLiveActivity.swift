//
//  ParkActivityLiveActivity.swift
//  ParkActivity
//
//  Created by Aziz Nurfalah on 03/02/26.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ParkActivityLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ParkActivityAttributes.self) { context in
            let date = context.state.date
            
            VStack(alignment: .leading) {
                Text("Park Sense").bold()
                
                ParkActivityBody(date: date, locationName: context.state.locationName)
            }
            .padding()
        } dynamicIsland: { context in
            let date = context.state.date
            
            return DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text("Park Sense")
                        .font(.headline)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    ParkActivityBody(date: date, locationName: context.state.locationName)
                }
            } compactLeading: {
                Text("P")
            } compactTrailing: {
                Text("S")
            } minimal: {
                Text("PS")
            }
            .widgetURL(URL(string: "parksense://parksense"))
            .keylineTint(Color.red)
        }
    }
}

private struct ParkActivityBody: View {
    let date: Date
    let locationName: String?
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text("Duration:").font(.caption)
                Text(date, style: .timer)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("Location:").font(.caption)
                
                Group {
                    if let locationName {
                        Text(locationName)
                            .font(.caption)
                            .multilineTextAlignment(.trailing)
                            .lineLimit(2)
                    } else {
                        Text("Not found")
                            .font(.caption)
                            .italic()
                    }
                }
            }
        }
        .padding(.top, 4)
    }
}
