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
            let locationName = context.state.location?.locationName
            
            VStack(alignment: .leading) {
                Text("Park Sense").bold()
                
                ParkActivityBody(date: date, locationName: locationName)
            }
            .padding()
        } dynamicIsland: { context in
            let date = context.state.date
            let locationName = context.state.location?.locationName
            
            return DynamicIsland {
                DynamicIslandExpandedRegion(.leading, priority: 1) {
                    Text("Park Sense").bold()
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    ParkActivityBody(date: date, locationName: locationName)
                }
                
//                DynamicIslandExpandedRegion(.leading) {
//                    VStack(alignment: .leading) {
//                        Text("Duration:")
//                            .font(.caption)
//                            .foregroundColor(Color(uiColor: UIColor.systemGray2))
//                        
//                        Text(date, style: .timer)
//                    }
//                }
//                
//                DynamicIslandExpandedRegion(.trailing) {
//                    VStack(alignment: .trailing) {
//                        Text("Location:")
//                            .font(.caption)
//                            .foregroundColor(Color(uiColor: UIColor.systemGray2))
//                        
//                        Text(locationName ?? "Not Found")
//                            .multilineTextAlignment(.trailing)
//                            .lineLimit(1)
//                    }
//                    .dynamicIsland(verticalPlacement: .belowIfTooWide)
//                }
            } compactLeading: {
                VStack(alignment: .leading) {
                    Image(systemName: "stopwatch.fill").foregroundColor(.blue)
                    
                    Text(date, style: .timer)
                }
            } compactTrailing: {
                VStack(alignment: .trailing) {
                    Image(systemName: "mappin.and.ellipse").foregroundColor(.blue)
                    
                    Text(locationName ?? "Not Found")
                        .font(.caption)
                        .lineLimit(2)
                        .multilineTextAlignment(.trailing)
                }
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
                Text("Duration:")
                    .font(.caption)
                    .foregroundColor(Color(uiColor: UIColor.systemGray2))
                
                Text(date, style: .timer)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("Location:")
                    .font(.caption)
                    .foregroundColor(Color(uiColor: UIColor.systemGray2))
                
                Group {
                    if let locationName {
                        Text(locationName)
                    } else {
                        Text("Not Found").italic()
                    }
                }
                .font(.caption).bold()
                .multilineTextAlignment(.trailing)
                .lineLimit(2)
            }
        }
        .padding(.top, 4)
    }
}

