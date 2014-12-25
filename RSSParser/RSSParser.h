//
//  RSSParser.h
//  RSSParser
//  Cook in owen
//
//  Created by Nikita Kuznetsov on 09.12.14.
//  Copyright (c) 2014 Nikita Kuznetsov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSItem.h"


@interface RSSParser : NSObject <NSXMLParserDelegate> {
    RSSItem *currentItem;
    NSMutableArray *items;
    NSMutableString *tmpString;
    void (^block)(NSArray *feedItems);
    void (^failblock)(NSError *error);
}



+ (void)parseRSSFeedForRequest:(NSURLRequest *)urlRequest
                       success:(void (^)(NSArray *feedItems))success
                       failure:(void (^)(NSError *error))failure;

- (void)parseRSSFeedForRequest:(NSURLRequest *)urlRequest
                       success:(void (^)(NSArray *feedItems))success
                       failure:(void (^)(NSError *error))failure;


@end
