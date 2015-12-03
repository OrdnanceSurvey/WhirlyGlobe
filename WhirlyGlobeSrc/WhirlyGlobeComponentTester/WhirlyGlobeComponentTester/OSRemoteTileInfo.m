//
//  OSRemoteTileInfo.m
//  WhirlyGlobeComponentTester
//
//  Created by Dave Hardiman on 20/11/2015.
//  Copyright © 2015 mousebird consulting. All rights reserved.
//

#import "OSRemoteTileInfo.h"

@implementation OSRemoteTileInfo

- (NSURLRequest *)requestForTile:(MaplyTileID)tileID {
    tileID.level -= 3;
    return [super requestForTile:tileID];
}

@end
