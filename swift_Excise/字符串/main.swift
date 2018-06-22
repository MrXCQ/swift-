//
//  main.swift
//  字符串
//
//  Created by zc on 2018/6/21.
//

import Foundation
import Cocoa
print("字符串 Hello, World!")

/**
 *  swift 和 OC 的字符不一样
 *  swift 是双引号
 *  swift 中的字符类型和OC OC的字符占一个字节 因为他包含ASCII 表中的字符 而swift 中的字符除了可以存储ASCII 表中的字符还可以存储Unicode 字符
    et.
 OC: char charStr = '熊'
 swift : var charStr :Character = "xiong"
 OC 的字符是遵守ASCII 标准的，Swift 的字符是遵守的unicode 标准的，所以存放实际上所有国家的字符
 */

var charValue1: Character = "熊"
/**
 *  双引号中只能放一个字符  如下是错误写法
 *   var charValue: character = "sdfdf"
 *
 */


/**
 *  字符串
 *  字符是单个字符的集合  字符串十多个字符的集合，想要存放多个字符需要使用字符串
 *  C:  char  *string  = "ab"     char  stringStr = "ab"
 *  OC :NSString *str = @"dfs"
 *
 */

var  str = "abc"


/**
 *  C 语言中的字符串是以 \0 结尾的例如：
 *  char *stringValue = "abc\0def"
 *  printf("%s", stringValue);
 *  打印结果为: abc
 *  OC 也是以 \0 结尾同C
 */


//var Str2 = "abcd\0efg"

//print(Str2)
//打印 abcdefg

//MARK:字符串的常用用法

/**
 *
 *  计算字符串的长度
 *  C char *str = "abc先试试"
 *  printf("%tu",strlen(str)) ; 12
 *  汉字 UTF-8 占三个字节，Unicode 和 ACSII 2 字节
 */
var string1 = "abc搜索"
print(string1.lengthOfBytes(using: String.Encoding.utf8)) //也是打印字节数 12

/**
 *  字符串拼接
 *  C
 *  char s1[] = "abc"
 *  char s2[] = "123"
 *  char *s = strcat(str1,str2) ;
 */


var s1 = "abc"
var s2 = "123"
var s3 = s1 + s2
print("s3 ---- \(s3)")

/**
 *  格式化字符串
 *  C 相当麻烦，指针，下标等方式
 *  OC format 格式化
 */
var index1 = 1454
var s4 = "http://www.baidu.com?search=\(index1)"

print("s4 ----- \(s4)")


/**
 *  字符串比较
 *  OC 使用 compare  或者  isEqualToString
 *  swift  == 、!=  、  >=  、 <= 和 C 语言一样是逐个比较
 */

var  s5 = "abc"
var  s6 = "abc"

if s5 == s6 {
    print("相等")
}else{
    print("不相等 ")
}

// 判断前缀 hasPresfix
// 判断后缀 hasSuffix


var s7 = "abc.TyS"

print("转换大写 --- \(s7.uppercased())")
print("转换小写 --- \(s7.lowercased())")


// 转化为基本数据类型
//OC:
//NSString *str = @"250";
//NSInteger number = [str integerValue];
//NSLog(@"%tu", number);

var s8 = "1256s"
// 如果str 不能转换为整数  那么可选类型返回为nil
// str = "12ss"  不能转换为整数所以返回可能为nil

var number:Int? = Int(s8)

if number != nil{
    print(number!)
}else{
    print(number as Any)
}


















