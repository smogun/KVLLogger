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
    public var pathExtension: String?
    {
        return URL(fileURLWithPath: self).pathExtension;
    }
    public var lastPathComponent: String?
    {
        return URL(fileURLWithPath: self).lastPathComponent;
    }
    public var stringByDeletingPathExtension: String?
    {
        do
        {
            return try String(contentsOf: URL(fileURLWithPath: self).deletingPathExtension());
        }
        catch
        {
            return self;
        }
    }
    
}
