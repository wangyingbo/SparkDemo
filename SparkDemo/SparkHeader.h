//
//  SparkHeader.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#ifndef SparkHeader_h
#define SparkHeader_h

#define FULL_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define FULL_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


#define SafePerformSelector(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


#endif /* SparkHeader_h */
