//
//  ModelRootWrapper.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 2/28/23.
//

#import "ModelElementWrapper.h"

#import "ModelObjectWrapper.h"
#import "ModelColorWrapper.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModelRootWrapper : ModelElementWrapper

+ (void) initialize;

@property (nonatomic, assign) bool compressed;

@property (nonatomic, readonly) ModelColorWrapper* colorNode;

@property (nonatomic, readonly) NSArray<ModelObjectWrapper*>* objectNodes;

@property (nonatomic, readonly) NSArray<ModelElementWrapper*>* materialNodes;

@property (nonatomic, readonly) NSArray<ModelElementWrapper*>* constellationNodes;

@end

NS_ASSUME_NONNULL_END
