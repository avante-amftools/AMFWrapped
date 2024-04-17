//
//  ModelVertexWrapper.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 3/22/23.
//

#import "ModelElementWrapper.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModelVertexWrapper : ModelElementWrapper

+ (void) initialize;

@property (nonatomic, readonly) VertexData vertexData;

@end

NS_ASSUME_NONNULL_END
