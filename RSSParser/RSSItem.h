//
//  RSSItem.h
//  RSSParser
//
//  Created by Thibaut LE LEVIER on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSSItem : NSObject <NSCoding>


//food
@property (strong,nonatomic) NSString *food_ID;

@property (strong,nonatomic) NSString *food_name;

@property (strong,nonatomic) NSString *food_description;

@property (strong,nonatomic) NSNumber *food_cooking_time;

@property (strong,nonatomic) NSNumber *food_rating;

@property (strong,nonatomic) NSNumber *food_calories;

@property (strong,nonatomic) NSString *food_image;

@property (strong,nonatomic) NSString *food_author;

@property (strong,nonatomic) NSNumber *food_shares_counter;

@property (strong,nonatomic) NSNumber *food_cooked_counter;

@property (strong,nonatomic) NSNumber *food_favorites_counter;

//ingredients
@property (strong,nonatomic) NSNumber *ingredients_ID;

@property (strong,nonatomic) NSString *ingredients_name;

//ingredient_weight
@property (strong,nonatomic) NSNumber *ingredient_weight_ID;

@property (strong,nonatomic) NSNumber *ingredient_weight_ID_food;

@property (strong,nonatomic) NSNumber *ingredient_weight_ID_ingredient;

@property (strong,nonatomic) NSNumber *ingredient_weight;

@property (strong,nonatomic) NSNumber *ingredient_weight_ID_weight_type;

//reviews
@property (strong,nonatomic) NSNumber *reviews_ID;

@property (strong,nonatomic) NSString *reviews_name;

@property (strong,nonatomic) NSString *reviews_message;

@property (strong,nonatomic) NSString *reviews_post_time;

@property (strong,nonatomic) NSNumber *reviews_rating;

@property (strong,nonatomic) NSNumber *reviews_ID_food;

@property (strong,nonatomic) NSString *reviews_username;

//stage
@property (strong,nonatomic) NSNumber *stage_ID;

@property (strong,nonatomic) NSNumber *stage_step_number;

@property (strong,nonatomic) NSString *stage_description;

@property (strong,nonatomic) NSString *stage_image;

@property (strong,nonatomic) NSNumber *stage_ID_food;

@property (strong,nonatomic) NSNumber *stage_time;

//weight_type
@property (strong,nonatomic) NSNumber *weight_type_ID;

@property (strong,nonatomic) NSString *weight_type_name;


-(NSArray *)imagesFromItemDescription;
-(NSArray *)imagesFromContent;

@end
