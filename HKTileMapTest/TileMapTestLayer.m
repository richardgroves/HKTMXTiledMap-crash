//
//  TileMapTestLayer.m
//
//  Created by Richard Groves on 15/02/2013
//  Copyright 2013 NoodlFroot Ltd. All rights reserved.
//

#import "TileMapTestLayer.h"

#import "HKTMXTiledMap.h"

@implementation TileMapTestLayer

// Helper class method that creates a Scene with the TileMapTestLayer as the only child.
+(CCScene *) scene:(int)mapNum
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	TileMapTestLayer *layer = [[[TileMapTestLayer alloc] init:mapNum] autorelease];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init:(int)mapNum
{
	if( (self=[super init]) )
	{
		NSString* mapName = [NSString stringWithFormat:@"TileMaps/TileMapL%d.tmx", mapNum];
		//CCTMXTiledMap* tileMap = [CCTMXTiledMap tiledMapWithTMXFile:mapName];
		HKTMXTiledMap* tileMap = [HKTMXTiledMap tiledMapWithTMXFile:mapName];
		[self addChild:tileMap];
	}
	
	return self;
}


@end
