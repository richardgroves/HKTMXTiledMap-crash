//
//  TileMapTestLayer.h
//
//  Created by Richard Groves on 15/02/2013
//  Copyright 2013 NoodlFroot Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface TileMapTestLayer : CCLayer

// returns a CCScene that contains the TileMapTestLayer as the only child
+(CCScene *) scene:(int)mapNum;

@end
