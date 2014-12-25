//
//  RSSItem.m
//  RSSParser
//  Cook in owen
//
//  Created by Nikita Kuznetsov on 09.12.14.
//  Copyright (c) 2014 Nikita Kuznetsov. All rights reserved.
//

#import "RSSItem.h"

@interface RSSItem (Private)

-(NSArray *)imagesFromHTMLString:(NSString *)htmlstr;

@end

@implementation RSSItem

-(NSArray *)imagesFromItemDescription
{
    if (self.food_image) {
        return [self imagesFromHTMLString:self.food_image];
    }
    
    return nil;
}

-(NSArray *)imagesFromContent
{
    if (self.food_description) {
        return [self imagesFromHTMLString:self.food_description];
    }
    
    return nil;
}

#pragma mark - retrieve images from html string using regexp (private methode)

-(NSArray *)imagesFromHTMLString:(NSString *)htmlstr
{
    NSMutableArray *imagesURLStringArray = [[NSMutableArray alloc] init];
    
    NSError *error;
    
    NSRegularExpression *regex = [NSRegularExpression         
                                  regularExpressionWithPattern:@"(https?)\\S*(png|jpg|jpeg|gif)"
                                  options:NSRegularExpressionCaseInsensitive
                                  error:&error];
    
    [regex enumerateMatchesInString:htmlstr 
                            options:0 
                              range:NSMakeRange(0, htmlstr.length) 
                         usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                             [imagesURLStringArray addObject:[htmlstr substringWithRange:result.range]];
                         }];    
    
    return [NSArray arrayWithArray:imagesURLStringArray];
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        //food
        _food_ID = [aDecoder decodeObjectForKey:@"food_ID"];
        
        _food_name = [aDecoder decodeObjectForKey:@"food_name"];
        
        _food_description = [aDecoder decodeObjectForKey:@"food_description"];
        
        _food_cooking_time = [aDecoder decodeObjectForKey:@"food_cooking_time"];
        
        _food_rating = [aDecoder decodeObjectForKey:@"food_rating"];
        
        _food_calories = [aDecoder decodeObjectForKey:@"food_calories"];
        
        _food_image = [aDecoder decodeObjectForKey:@"food_image"];
        
        _food_author = [aDecoder decodeObjectForKey:@"food_author"];
        
        _food_shares_counter = [aDecoder decodeObjectForKey:@"food_shares_counter"];
        
        _food_cooked_counter = [aDecoder decodeObjectForKey:@"food_cooked_counter"];
        
        _food_favorites_counter = [aDecoder decodeObjectForKey:@"food_favorites_counter"];
        
        //ingredients
        _ingredients_ID = [aDecoder decodeObjectForKey:@"ingredients_ID"];
        
        _ingredients_name = [aDecoder decodeObjectForKey:@"ingredients_name"];
        
        //ingredient_weight
        _ingredient_weight_ID = [aDecoder decodeObjectForKey:@"ingredient_weight_ID"];
        
        _ingredient_weight_ID_food = [aDecoder decodeObjectForKey:@"ingredient_weight_ID_food"];
        
        _ingredient_weight_ID_ingredient = [aDecoder decodeObjectForKey:@"ingredient_weight_ID_ingredient"];
        
        _ingredient_weight = [aDecoder decodeObjectForKey:@"ingredient_weight"];
        
        _ingredient_weight_ID_weight_type = [aDecoder decodeObjectForKey:@"ingredient_weight_ID_weight_type"];
        
        //reviews
        _reviews_ID = [aDecoder decodeObjectForKey:@"reviews_ID"];
        
        _reviews_name = [aDecoder decodeObjectForKey:@"reviews_name"];
        
        _reviews_message = [aDecoder decodeObjectForKey:@"reviews_message"];
        
        _reviews_post_time = [aDecoder decodeObjectForKey:@"reviews_post_time"];
        
        _reviews_rating = [aDecoder decodeObjectForKey:@"reviews_rating"];
        
        _reviews_ID_food = [aDecoder decodeObjectForKey:@"reviews_ID_food"];
        
        _reviews_username = [aDecoder decodeObjectForKey:@"reviews_username"];
        
        //stage
        _stage_ID = [aDecoder decodeObjectForKey:@"stage_ID"];
        
        _stage_step_number = [aDecoder decodeObjectForKey:@"stage_step_number"];
        
        _stage_description = [aDecoder decodeObjectForKey:@"stage_description"];
        
        _stage_image = [aDecoder decodeObjectForKey:@"stage_image"];
        
        _stage_ID_food = [aDecoder decodeObjectForKey:@"stage_ID_food"];
        
        _stage_time = [aDecoder decodeObjectForKey:@"stage_time"];
        
        //weight_type
        _weight_type_ID = [aDecoder decodeObjectForKey:@"weight_type_ID"];
        
        _weight_type_name = [aDecoder decodeObjectForKey:@"weight_type_name"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    //food
    [aCoder encodeObject:self.food_ID forKey:@"food_ID"];
    
    [aCoder encodeObject:self.food_name forKey:@"food_name"];
    
    [aCoder encodeObject:self.food_description forKey:@"food_description"];
    
    [aCoder encodeObject:self.food_cooking_time forKey:@"food_cooking_time"];
    
    [aCoder encodeObject:self.food_rating forKey:@"food_rating"];
    
    [aCoder encodeObject:self.food_calories forKey:@"food_calories"];
    
    [aCoder encodeObject:self.food_image forKey:@"food_image"];
    
    [aCoder encodeObject:self.food_author forKey:@"food_author"];
    
    [aCoder encodeObject:self.food_shares_counter forKey:@"food_shares_counter"];
    
    [aCoder encodeObject:self.food_cooked_counter forKey:@"food_cooked_counter"];
    
    [aCoder encodeObject:self.food_favorites_counter forKey:@"food_favorites_counter"];
    
    //ingredients
    [aCoder encodeObject:self.ingredients_ID forKey:@"ingredients_ID"];
    
    [aCoder encodeObject:self.ingredients_name forKey:@"ingredients_name"];
    
    //ingredient_weight
    [aCoder encodeObject:self.ingredient_weight_ID forKey:@"ingredient_weight_ID"];
    
    [aCoder encodeObject:self.ingredient_weight_ID_food forKey:@"ingredient_weight_ID_food"];
    
    [aCoder encodeObject:self.ingredient_weight_ID_ingredient forKey:@"ingredient_weight_ID_ingredient"];
    
    [aCoder encodeObject:self.ingredient_weight forKey:@"ingredient_weight"];
    
    [aCoder encodeObject:self.ingredient_weight_ID_weight_type forKey:@"ingredient_weight_ID_weight_type"];
    
    //reviews
    [aCoder encodeObject:self.reviews_ID forKey:@"reviews_ID"];
    
    [aCoder encodeObject:self.reviews_name forKey:@"reviews_name"];
    
    [aCoder encodeObject:self.reviews_message forKey:@"reviews_message"];
    
    [aCoder encodeObject:self.reviews_post_time forKey:@"reviews_post_time"];
    
    [aCoder encodeObject:self.reviews_rating forKey:@"reviews_rating"];
    
    [aCoder encodeObject:self.reviews_ID_food forKey:@"reviews_ID_food"];
    
    [aCoder encodeObject:self.reviews_username forKey:@"reviews_username"];
    
    //stage
    [aCoder encodeObject:self.stage_ID forKey:@"stage_ID"];
    
    [aCoder encodeObject:self.stage_step_number forKey:@"stage_step_number"];
    
    [aCoder encodeObject:self.stage_description forKey:@"stage_description"];
    
    [aCoder encodeObject:self.stage_image forKey:@"stage_image"];
    
    [aCoder encodeObject:self.stage_ID_food forKey:@"stage_ID_food"];
    
    [aCoder encodeObject:self.stage_time forKey:@"stage_time"];
    
    //weight_type
    [aCoder encodeObject:self.weight_type_ID forKey:@"weight_type_ID"];
    
    [aCoder encodeObject:self.weight_type_name forKey:@"weight_type_name"];
}

#pragma mark -
/*
- (BOOL)isEqual:(RSSItem *)object
{
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    return [self.link.absoluteString isEqualToString:object.link.absoluteString];
}

- (NSUInteger)hash
{
    return [self.link hash];
}
 */

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %@>", [self class], [self.food_image stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
}

@end
