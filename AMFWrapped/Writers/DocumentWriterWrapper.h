//
//  DocumentWriterWrapper.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 10/10/23.
//

#import "ModelElementWrapper.h"

#import "ModelRootWrapper.h"

NS_ASSUME_NONNULL_BEGIN

@interface DocumentWriterWrapper : ModelElementWrapper

+ (void) initialize;

+ (DocumentWriterWrapper*) documentWriterWithModelRoot: (ModelRootWrapper*) root
                                              fileType: (NSString*) fileType;

@property (nonatomic, readonly) NSData* data;

@end

NS_ASSUME_NONNULL_END
