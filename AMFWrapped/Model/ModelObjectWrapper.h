//
//  ModelObjectWrapper.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelElementWrapper.h"

#import "ModelMeshWrapper.h"
#import "ModelVertexWrapper.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModelObjectWrapper : ModelElementWrapper

+ (void) initialize;

@property (nonatomic, readonly) ModelMeshWrapper* meshNode;

@end

NS_ASSUME_NONNULL_END
