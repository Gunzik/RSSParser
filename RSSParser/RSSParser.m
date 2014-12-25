//
//  RSSParser.m
//  Cook in owen
//
//  Created by Nikita Kuznetsov on 09.12.14.
//  Copyright (c) 2014 Nikita Kuznetsov. All rights reserved.
//

#import "RSSParser.h"

#import "AFHTTPRequestOperation.h"
#import "AFURLResponseSerialization.h"

@implementation RSSParser

#pragma mark lifecycle
- (id)init {
    self = [super init];
    if (self) {
        items = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark -

#pragma mark parser

+ (void)parseRSSFeedForRequest:(NSURLRequest *)urlRequest
                       success:(void (^)(NSArray *feedItems))success
                       failure:(void (^)(NSError *error))failure
{
    RSSParser *parser = [[RSSParser alloc] init];
    [parser parseRSSFeedForRequest:urlRequest success:success failure:failure];
}


- (void)parseRSSFeedForRequest:(NSURLRequest *)urlRequest
                                          success:(void (^)(NSArray *feedItems))success
                                          failure:(void (^)(NSError *error))failure
{
    
    block = [success copy];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
    
    operation.responseSerializer = [[AFXMLParserResponseSerializer alloc] init];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/xml", @"text/xml",@"application/rss+xml", @"application/atom+xml", nil];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        failblock = [failure copy];
        [(NSXMLParser *)responseObject setDelegate:self];
        [(NSXMLParser *)responseObject parse];
    }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         failure(error);
                                     }];
    
    [operation start];
    
}

#pragma mark -
#pragma mark NSXMLParser delegate

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    
    if ([elementName isEqualToString:@"item"] || [elementName isEqualToString:@"entry"])
    {
        currentItem = [[RSSItem alloc] init];
    }
    
    tmpString = [[NSMutableString alloc] init];
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{    
    if ([elementName isEqualToString:@"item"] || [elementName isEqualToString:@"entry"])
    {
        [items addObject:currentItem];
    }
    if (currentItem != nil && tmpString != nil)
    {
        //food
        if ([elementName isEqualToString:@"food_ID"])
        {
            [currentItem setFood_ID:tmpString];
        }
        
        if ([elementName isEqualToString:@"food_name"])
        {
            [currentItem setFood_name:tmpString];
        }
        
        if ([elementName isEqualToString:@"food_description"])
        {
            [currentItem setFood_description:tmpString];
        }
        
        if ([elementName isEqualToString:@"food_cooking_time"])
        {
            [currentItem setFood_cooking_time:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        if ([elementName isEqualToString:@"food_rating"])
        {
            [currentItem setFood_rating:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        if ([elementName isEqualToString:@"food_calories"])
        {
            [currentItem setFood_calories:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        if ([elementName isEqualToString:@"food_image"])
        {
            [currentItem setFood_image:tmpString];
        }
        
        if ([elementName isEqualToString:@"food_author"])
        {
            [currentItem setFood_author:tmpString];
        }
        
        if ([elementName isEqualToString:@"food_shares_counter"])
        {
            [currentItem setFood_shares_counter:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        if ([elementName isEqualToString:@"food_cooked_counter"])
        {
            [currentItem setFood_cooked_counter:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        if ([elementName isEqualToString:@"food_favorites_counter"])
        {
            [currentItem setFood_favorites_counter:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        //ingredients
        if ([elementName isEqualToString:@"ingredients_ID"])
        {
            [currentItem setIngredients_ID:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        if ([elementName isEqualToString:@"ingredients_name"])
        {
            [currentItem setIngredients_name:tmpString];
        }
        
        //ingredient_weight
        if ([elementName isEqualToString:@"ingredient_weight_ID"])
        {
            [currentItem setIngredient_weight_ID:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        if ([elementName isEqualToString:@"ingredient_weight_ID_food"])
        {
            [currentItem setIngredient_weight_ID_food:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        if ([elementName isEqualToString:@"ingredient_weight_ID_ingredient"])
        {
            [currentItem setIngredient_weight_ID_ingredient:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        if ([elementName isEqualToString:@"ingredient_weight"])
        {
            [currentItem setIngredient_weight:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        if ([elementName isEqualToString:@"ingredient_weight_ID_weight_type"])
        {
            [currentItem setIngredient_weight_ID_weight_type:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        //reviews
        if ([elementName isEqualToString:@"reviews_ID"])
        {
            [currentItem setReviews_ID:[NSNumber numberWithInt:[tmpString intValue]]];
        }
      
        if ([elementName isEqualToString:@"reviews_name"])
        {
            [currentItem setReviews_name:tmpString];
        }
        
        if ([elementName isEqualToString:@"reviews_message"])
        {
            [currentItem setReviews_message:tmpString];
        }
        
        if ([elementName isEqualToString:@"reviews_post_time"])
        {
            [currentItem setReviews_post_time:tmpString];
        }
        
        if ([elementName isEqualToString:@"reviews_rating"])
        {
            [currentItem setReviews_rating:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        if ([elementName isEqualToString:@"reviews_ID_food"])
        {
            [currentItem setReviews_ID_food:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        if ([elementName isEqualToString:@"reviews_username"])
        {
            [currentItem setReviews_username:tmpString];
        }
        
        //stage
        if ([elementName isEqualToString:@"stage_ID"])
        {
            [currentItem setStage_ID:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        if ([elementName isEqualToString:@"stage_step_number"])
        {
            [currentItem setStage_step_number:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        if ([elementName isEqualToString:@"stage_description"])
        {
            [currentItem setStage_description:tmpString];
        }
        
        if ([elementName isEqualToString:@"stage_image"])
        {
            [currentItem setStage_image:tmpString];
        }
        
        if ([elementName isEqualToString:@"stage_ID_food"])
        {
            [currentItem setStage_ID_food:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        if ([elementName isEqualToString:@"stage_time"])
        {
            [currentItem setStage_time:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        //weight_type
        if ([elementName isEqualToString:@"weight_type_ID"])
        {
        [currentItem setWeight_type_ID:[NSNumber numberWithInt:[tmpString intValue]]];
        }
        
        if ([elementName isEqualToString:@"weight_type_name"])
        {
        [currentItem setWeight_type_name:tmpString];
        }
    }
    
    if ([elementName isEqualToString:@"rss"] || [elementName isEqualToString:@"feed"]) {
        block(items);
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [tmpString appendString:string];
    
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    failblock(parseError);
    [parser abortParsing];
}

#pragma mark -

@end


