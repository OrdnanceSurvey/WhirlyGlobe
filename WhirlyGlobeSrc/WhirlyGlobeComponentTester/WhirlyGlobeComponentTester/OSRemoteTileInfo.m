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
  int matrix = tileID.level - 3;
  int col = tileID.x;
  int row = ((int)(1 << tileID.level) - tileID.y) - 1;

  // Fetch the traditional way
  NSString *fullURLStr = [[[self.baseURL
      stringByReplacingOccurrencesOfString:@"{z}"
                                withString:[@(matrix) stringValue]]
      stringByReplacingOccurrencesOfString:@"{x}"
                                withString:[@(col) stringValue]]
      stringByReplacingOccurrencesOfString:@"{y}"
                                withString:[@(row) stringValue]];
  if (self.ext) {
    fullURLStr = [NSString stringWithFormat:@"%@.%@", fullURLStr, self.ext];
  }

  //  NSLog(@"Fetching: %@", fullURLStr);

  return [NSMutableURLRequest requestWithURL:[NSURL URLWithString:fullURLStr]];
}

@end
