//
//  ModelVolumeWrapper.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelElementWrapper.h"

#import "ModelTriangleWrapper.h"

NS_ASSUME_NONNULL_BEGIN

@class ModelMeshWrapper;

@interface ModelVolumeWrapper : ModelElementWrapper

+ (void) initialize;

@property (nonatomic, readonly) NSArray<ModelTriangleWrapper*>* triangleNodes;

@end

NS_ASSUME_NONNULL_END
