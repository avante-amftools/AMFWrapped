//
//  DocumentReaderWrapper.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import <Foundation/Foundation.h>

#import "ModelRootWrapper.h"

NS_ASSUME_NONNULL_BEGIN

@interface DocumentReaderWrapper : NSObject

+ (void) initialize;

+ (DocumentReaderWrapper*) documentReaderWithData: (NSData*) data
                                         fileType: (NSString*) fileType;

- (ModelRootWrapper*) fromFile;

@end

NS_ASSUME_NONNULL_END
