//
//  AMFWrapped.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/23/23.
//

#import <Foundation/Foundation.h>

#import "DocumentReaderWrapper.h"
#import "DocumentWriterWrapper.h"
#import "ModelMetadataWrapper.h"

NS_ASSUME_NONNULL_BEGIN

@interface AMFWrapped : NSObject

+ (void) initialize;

+ (void) initializeSTL;

@end

NS_ASSUME_NONNULL_END
