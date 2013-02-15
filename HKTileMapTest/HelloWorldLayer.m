//
//  HelloWorldLayer.m
//  HKTileMapTest
//
//  Created by Richard Groves on 15/02/2013.
//  Copyright NoodlFroot Ltd. 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#import "TileMapTestLayer.h"
#import "HKTMXTiledMap.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
		
		//
		// Leaderboards and Achievements
		//
		
		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:28];
		
		CCMenuItemLabel* tileMap1 = [CCMenuItemFont itemWithString:@"TileMap 1" block:^(id sender)
										{
										// Adding the tilemap here does crash
											int mapNum = 1;
											NSString* mapName = [NSString stringWithFormat:@"TileMaps/TileMapL%d.tmx", mapNum];
											//CCTMXTiledMap* tileMap = [CCTMXTiledMap tiledMapWithTMXFile:mapName];
											HKTMXTiledMap* tileMap = [HKTMXTiledMap tiledMapWithTMXFile:mapName];
											[self addChild:tileMap];
											
//											[[CCDirector sharedDirector] pushScene:[TileMapTestLayer scene:1]];
										}];
		
		
		CCMenu *menu = [CCMenu menuWithItems:tileMap1, nil];
		
		[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( size.width/2, size.height/2 - 50)];
		
		// Add the menu to the layer
		[self addChild:menu];

	// RAG: Adding the tilemap directly here doesn't crash
	/*
		int mapNum = 1;
		NSString* mapName = [NSString stringWithFormat:@"TileMaps/TileMapL%d.tmx", mapNum];
		//CCTMXTiledMap* tileMap = [CCTMXTiledMap tiledMapWithTMXFile:mapName];
		HKTMXTiledMap* tileMap = [HKTMXTiledMap tiledMapWithTMXFile:mapName];
		[self addChild:tileMap];
*/
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end
