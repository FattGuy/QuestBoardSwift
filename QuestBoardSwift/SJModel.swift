//
//  SJModel.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/20/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit

class SJModel: NSObject {
    
    required internal override init() {
        
    }
    
    internal class func dictionaryToModel<T>(dict:AnyObject?) -> T!{
        if dict == nil{
            return nil
        }
        
        let obj = self.init()
        
        let mapKeys = obj.keyMapper()
        
        let properties:Mirror = Mirror(reflecting: obj)
        
        if let propertyList = AnyBidirectionalCollection(properties.children){
            
            for index in propertyList.startIndex..<propertyList.endIndex{
                let property = propertyList[index]
                let key = property.label
                let type = property.value
                
                var mkey = ""
                if mapKeys != nil{
                    mkey = mapKeys![key!] == nil ? key! : mapKeys![key!]!
                }else{
                    mkey = key!
                }
                
                switch type{
                case is Int, is Int64, is NSInteger:
                    let value = dict?.objectForKey(mkey)?.integerValue
                    if value != nil{
                        obj.setValue(value, forKey: key!)
                    }
                    
                    break
                    
                case is Float,is Double,is Bool,is NSNumber:
                    let value: AnyObject! = dict?.objectForKey(mkey)
                    
                    if value != nil{
                        obj.setValue(value, forKey: key!)
                    }
                    
                    break
                    
                case is String:
                    let value = dict?.objectForKey(mkey)
                    if value != nil{
                        obj.setValue(value, forKey: key!)
                    }
                    
                    break
                case is Array<String>:
                    if let arrayObject = dict?.objectForKey(mkey) as? NSArray {
                        var array:Array<String> = []
                        for element in arrayObject {
                            if let typedElement = element as? String {
                                array.append(typedElement)
                            }
                        }
                        obj.setValue(array, forKey: key!)
                    }
                    break
                case is Array<Int>:
                    if let arrayObject = dict?.objectForKey(mkey) as? NSArray {
                        var array:Array<Int> = []
                        for element in arrayObject {
                            if let typedElement = element as? Int {
                                array.append(typedElement)
                            }
                        }
                        obj.setValue(array, forKey: key!)
                    }
                    break
                default:
                    let otherType = Mirror(reflecting: type).subjectType
                    switch otherType{
                    case is Optional<String>.Type, is Optional<NSNumber>.Type, is Optional<NSInteger>.Type, is Optional<Array<String>>.Type, is Optional<Array<Int>>.Type:
                        obj.setValue(dict?.objectForKey(mkey), forKey: key!)
                        break
                    default:
                        let name:NSString = String(otherType)
                        let className = getClassName(name) as String
                        let clazz:AnyClass! = NSClassFromString(className)
                        
                        if clazz != nil{
                            if let data = dict?.objectForKey(mkey) as? NSArray{
                                let value = clazz.arrayToModelList(data)
                                obj.setValue(value, forKey: key!)
                            }
                            else{
                                let value = dict?.objectForKey(mkey)
                                obj.setValue((clazz as! SJModel.Type).dictionaryToModel(value),forKey:key!)
                            }
                        }else{
                            print("unknow property type")
                        }
                        
                        break
                    }
                    break
                }
            }
            
            
        }else{
            return nil
        }
        
        return obj as! T
    }
    
    internal class func arrayToModelList(data:AnyObject?)->Array<AnyObject>{
        if data == nil{
            return []
        }
        
        var objArray:Array<AnyObject> = []
        if let dicts = data as? NSArray{
            for i in 0..<dicts.count {
                let dict:AnyObject = dicts[i]
                objArray.append(dictionaryToModel(dict))
            }
        }
        return objArray
    }
    
    private class func getClassName(name:NSString)->NSString!{
        var range = name.rangeOfString("<.*>", options: NSStringCompareOptions.RegularExpressionSearch)
        if range.location != NSNotFound{
            range.location += 1
            range.length -= 2
            return getClassName(name.substringWithRange(range))
        }
        else{
            return name
        }
    }
    
    //    ["model key":"json key"]
    internal func keyMapper()->[String:String]!{
        return nil
    }
}

