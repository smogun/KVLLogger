//
//  NSString+Extensions.swift
//  KVLHelpers
//
//  Created by Misha Koval on 9/19/15.
//  Copyright (c) 2015 Misha Koval. All rights reserved.
//

import Foundation

public extension String
{
    var pathExtension: String?
    {
        return URL(fileURLWithPath: self).pathExtension;
    }
    var lastPathComponent: String?
    {
        return URL(fileURLWithPath: self).lastPathComponent;
    }
    var stringByDeletingPathExtension: String?
    {
        return URL(fileURLWithPath: self).deletingPathExtension().lastPathComponent
    }
    
}
