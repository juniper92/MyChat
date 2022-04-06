//
//  Fonts.swift
//  MyChat
//
//  Created by Mila on 2022/04/06.
//

import SwiftUI

extension Font {
    
    public static var bodyText: Font {
        return Font.custom("ONEMobileRegular", size: 14)
    }
    
    public static var button: Font {
        return Font.custom("ONEMobileBold", size: 14)
    }
    
    public static var smallText: Font {
        return Font.custom("ONEMobileLight", size: 11)
    }
    
    public static var tabBar: Font {
        return Font.custom("ONEMobileBold", size: 13)
    }
    
    public static var settings: Font {
        return Font.custom("ONEMobileRegular", size: 16)
    }
    
    public static var titleText: Font {
        return Font.custom("ONEMobileBold", size: 23)
    }
    
    public static var pageTitle: Font {
        return Font.custom("ONEMobileBold", size: 33)
    }
    
    public static var chatHeading: Font {
        return Font.custom("ONEMobileBold", size: 19)
    }
}
